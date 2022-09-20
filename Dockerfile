Sept 6
do:
cd .. #home directory
./python-docker/bsub.sh
refresh folders


#Notes
#Worked 8/25
#docker build -t hitslim0.0 . 
#docker run -it -v "$(pwd)":/python-docker-repo --name hitenv0.0 hitslim0.0 /bin/bash
#
#docker tag hitslim0.0 22csnyder/hitslim0.0
#docker push 22csnyder/hitslim0.0
#git clone git@github.com:22csnyder/hit-repo.git  / git pull
#bsub -Is -G compute-zaydmanm -q general-interactive -a 'docker(python:alpine3.16)' /bin/sh
#bsub -Is -G compute-zaydmanm -q general-interactive -a 'docker(22csnyder/hitslim0.0)' /bin/bash
#bsub -Is -G compute-zaydmanm -q general-interactive -a 'docker(22csnyder/hit-slim)' /bin/bash

#cd hit-repo
#bsub -Is -G compute-zaydmanm -q general-interactive -a 'docker(22csnyder/hit-slimdoc:0.1)' /bin/bash

#LSF_DOCKER_VOLUMES='/storage1/fs1/zaydmanm/Active:/storage1/fs1/zaydmanm/Active ~/.ssh:~/.ssh' bsub -Is -G compute-zaydmanm -q general-interactive -a 'docker(22csnyder/hit-slimdoc:0.1)' /bin/bash

#Fixed Git permissions!
#LSF_DOCKER_VOLUMES='/storage1/fs1/zaydmanm/Active:/storage1/fs1/zaydmanm/Active /home/csnyder/.ssh:/home/csnyder/.ssh' bsub -Is -G compute-zaydmanm -q general-interactive -a 'docker(22csnyder/hit-slimdoc:0.1)' /bin/bash

#rebuild
#There's a --no-cache option:
#  docker build --no-cache -t u12_core -f u12_core .

FROM python:slim

RUN apt-get -y update && apt-get install -y \
    git \
    vim \
    tmux \
    && rm -rf /var/lib/apt/lists/*

#docker build -t sample-image .

WORKDIR /app
COPY requirements.txt requirements.txt
#COPY . .

RUN python3 -m pip install --upgrade pip && pip3 install -r requirements.txt

#ENV LSF_DOCKER_PORTS='8050:8080'
#ENV LSF_DOCKER_VOLUMES="/storage1/fs1/zaydmanm/Active:/storage1/fs1/zaydmanm/Active"
ENV HIT='/storage/fs1/zaydmanm/Active/HIT'

#ENV HIT2="$(LSF_DOCKER_VOLUMES)"


#EXPOSE 8080

CMD ipython #is run if no file to run passed 

