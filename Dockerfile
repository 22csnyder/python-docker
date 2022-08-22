FROM python:alpine3.16

RUN apk add --update-cache \
    python \
    python-dev \
    py-pip \
    build-base \
    && rm -rf /var/cache/apk/*

RUN pip install -r requirements.txt

EXPOSE 8080

CMD ipython

