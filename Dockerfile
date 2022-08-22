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

EXPOSE 8080

COPY . .
CMD ipython

