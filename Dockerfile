FROM vydev/awscli:latest as resource
RUN apk add --update --no-cache \
    curl \
    bash
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip && \
    echo "terraform.zip" | unzip terraform.zip && mv terraform /usr/bin && rm terraform.zip

FROM resource
ENTRYPOINT [ "terraform" ]
CMD [ "-version" ]
