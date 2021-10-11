FROM vydev/awscli:latest as resource

RUN apk add --update --no-cache \
    curl \
    bash
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_amd64.zip && \
    echo "terraform.zip" | unzip terraform.zip && mv terraform /usr/bin && rm terraform.zip

ENTRYPOINT [ "terraform" ]
CMD [ "-version" ]
