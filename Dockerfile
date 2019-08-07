# This dockerfile is used by CI for this project
# It is pushed to dockerhub, image looveh/api-ci
# See here for instructions on usage: https://circleci.com/docs/2.0/custom-images/

FROM circleci/clojure:openjdk-8-lein-2.9.1

WORKDIR /tmp

RUN apt-get update
RUN apt-get install -y python-pip python-dev build-essential

RUN pip install awscli --user

ENV PATH=$PATH:/root/.local/bin

RUN aws --version
