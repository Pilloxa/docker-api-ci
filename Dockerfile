# This dockerfile is used by CI for this project
# It is pushed to dockerhub, image looveh/api-ci
# See here for instructions on usage: https://circleci.com/docs/2.0/custom-images/

FROM openjdk:8

ENV BOOT_VERSION=2.7.2
ENV BOOT_INSTALL=/usr/local/bin/

WORKDIR /tmp

RUN mkdir -p $BOOT_INSTALL \
  && wget -q https://github.com/boot-clj/boot-bin/releases/download/2.7.2/boot.sh \
  && echo "Comparing installer checksum..." \
  && echo "f717ef381f2863a4cad47bf0dcc61e923b3d2afb *boot.sh" | sha1sum -c - \
  && mv boot.sh $BOOT_INSTALL/boot \
  && chmod 0755 $BOOT_INSTALL/boot

ENV PATH=$PATH:$BOOT_INSTALL
ENV BOOT_AS_ROOT=yes

RUN boot

RUN apt-get update
RUN apt-get install -y python-pip python-dev build-essential

RUN pip install awscli --user

ENV PATH=$PATH:/root/.local/bin

RUN aws --version
