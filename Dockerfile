FROM golang:1
RUN go get github.com/smreed/garble
RUN apt-get update && apt-get install -y \
  cowsay \
  grep \
  less \
  tree
RUN ln -s /usr/games/cowsay /usr/bin/
RUN cowsay it worked
RUN curl https://sdk.cloud.google.com | bash
RUN /root/google-cloud-sdk/bin/gcloud components install kubectl
RUN cp /root/google-cloud-sdk/bin/kubectl /usr/bin
RUN cp /root/google-cloud-sdk/bin/gcloud /usr/bin
ADD /cfg /cfg
RUN find /cfg
ADD /.garble /root/.garble
ADD /*.sh /
WORKDIR /
ENTRYPOINT ["/go.sh"]
