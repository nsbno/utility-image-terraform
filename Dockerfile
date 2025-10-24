FROM python:3.11-alpine as resource
ARG TERRAFORM_VERSION=1.13.4
ARG AWSCLI_VERSION=1.42.38

RUN apk add --update --no-cache \
    bash \
    curl \
    git \
    make \
    zip \
    unzip \
    jq \
    openssh

RUN pip install --no-cache-dir awscli==$AWSCLI_VERSION

RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "terraform.zip" | unzip terraform.zip && mv terraform /usr/bin && rm terraform.zip

ENTRYPOINT [ "terraform" ]
CMD [ "-version" ]
