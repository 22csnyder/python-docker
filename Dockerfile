FROM python:alpine3.16

RUN apk add --update-cache \
    python \
    python-dev \
    py-pip \
    build-base \
    && rm -rf /var/cache/apk/*

RUN pip install -r requirements.txt

ENV LSF_DOCKER_PORTS='8050:8080'
ENV LSF_DOCKER_VOLUMES="/storage1/fs1/zaydmanm/Active:/storage1/fs1/zaydmanm/Active"

EXPOSE 8080

CMD ipython

