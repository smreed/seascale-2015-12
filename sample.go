package main

import (
	"fmt"

	"k8s.io/kubernetes/pkg/api"
	apiu "k8s.io/kubernetes/pkg/api/unversioned"
	"k8s.io/kubernetes/pkg/client/unversioned"
	"k8s.io/kubernetes/pkg/client/unversioned/clientcmd"
	"k8s.io/kubernetes/pkg/labels"
)

type serviceLister interface {
	List(apiu.ListOptions) (*api.ServiceList, error)
}

type endpointGetter interface {
	Get(name string) (*api.Endpoints, error)
}

func main() {
	c := mustConnectToKubernetes()
	var s serviceLister = c.Services("default")
	var e endpointGetter = c.Endpoints("default")

	svcs, _ := s.List(opts)
	for _, svc := range svcs.Items {
		if endpoints, _ := e.Get(svc.Name); len(endpoints.Subsets) > 0 {
			n := 0
			for _, subset := range endpoints.Subsets {
				n += len(subset.Addresses)
			}
			fmt.Printf("%q has %d endpoints\n", svc.Name, n)
		}
	}
}

func mustConnectToKubernetes() *unversioned.Client {
	cfg, _ := kubernetesClientConfig()
	client, _ := unversioned.New(cfg)
	return client
}

func kubernetesClientConfig() (*unversioned.Config, error) {
	// first, try in-cluster
	if cluster, err := unversioned.InClusterConfig(); err == nil {
		return cluster, nil
	}

	// now, try to do what `kubectl` would do
	rules := clientcmd.NewDefaultClientConfigLoadingRules()
	cfg, _ := rules.Load()
	kubeConfig := clientcmd.NewNonInteractiveClientConfig(*cfg, "", &clientcmd.ConfigOverrides{})
	return kubeConfig.ClientConfig()
}

var (
	opts = apiu.ListOptions{
		LabelSelector: apiu.LabelSelector{
			Selector: labels.Everything(),
		},
	}
)
