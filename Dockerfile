FROM vydev/awscli:latest as resource
ARG TERRAFORM_VERSION=1.7.0

RUN apk add --update --no-cache \
    curl \
    bash

RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "terraform.zip" | unzip terraform.zip && mv terraform /usr/bin && rm terraform.zip

ENTRYPOINT [ "terraform" ]
CMD [ "-version" ]
