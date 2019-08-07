# This dockerfile is used by CI for this project
# It is pushed to dockerhub, image pilloxa/docker-api-ci
# https://cloud.docker.com/u/pilloxa/repository/docker/pilloxa/docker-api-ci

FROM circleci/clojure:openjdk-8-lein-2.9.1

RUN lein --version

USER root
RUN apt-get update
RUN apt-get install -y python3
RUN python3 --version
USER circleci

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py --user

ENV PATH=$PATH:/home/circleci/.local/bin

RUN pip3 install awscli --user

RUN aws --version
