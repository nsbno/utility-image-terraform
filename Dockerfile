FROM vydev/awscli:latest as resource
RUN apk add --update --no-cache \
    curl
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip && \
    echo "terraform.zip" | unzip terraform.zip && mv terraform /usr/bin && rm terraform.zip

FROM resource
ENTRYPOINT [ "terraform" ]
CMD [ "-version" ]