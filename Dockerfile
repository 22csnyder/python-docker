FROM python:alpine3.10

RUN apk add --update-cache \
#    tmux \
    git \
#    vim \
    cmake
    build-base \
    && rm -rf /var/cache/apk/*

WORKDIR /app
COPY requirements.txt requirements.txt

RUN python3 -m pip install --upgrade pip && pip3 install -r requirements.txt

#ENV LSF_DOCKER_PORTS='8050:8080'
#ENV LSF_DOCKER_VOLUMES="/storage1/fs1/zaydmanm/Active:/storage1/fs1/zaydmanm/Active"
ENV HIT='/storage/fs1/zaydmanm/Active/HIT'


#EXPOSE 8080

#COPY . .
CMD ipython #is run if no file to run passed 

