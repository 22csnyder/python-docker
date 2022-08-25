FROM python:alpine3.10


RUN apk add --update-cache \
    tmux \
    git \
    vim \
    build-base \
    && rm -rf /var/cache/apk/*

WORKDIR /app
COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

ENV LSF_DOCKER_PORTS='8050:8080'
ENV LSF_DOCKER_VOLUMES="/storage1/fs1/zaydmanm/Active:/storage1/fs1/zaydmanm/Active"

EXPOSE 8080

COPY . .
CMD ipython

