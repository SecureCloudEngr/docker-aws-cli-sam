FROM debian:bullseye-slim

ENV PACKAGES="curl zip"
RUN apt-get update \
    && apt-get install -y $PACKAGES \
    && curl -L https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws \
    && rm /tmp/awscliv2.zip \
    && curl -L https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip -o /tmp/aws-sam-cli-linux-x86_64.zip \
    && unzip /tmp/aws-sam-cli-linux-x86_64.zip -d /tmp/sam-installation \
    && /tmp/sam-installation/install \
    && rm -rf /tmp/sam-installation \
    && rm /tmp/aws-sam-cli-linux-x86_64.zip \
    && apt-get --purge remove -y $PACKAGES

#ENTRYPOINT ["/bin/bash"]