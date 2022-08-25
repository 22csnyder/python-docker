#Notes
#Worked 8/25
#docker build -t hitslim0.0 . 
#docker run -it -v "$(pwd)":/python-docker-repo --name hitenv0.0 hitslim0.0 /bin/bash
#
#docker tag hitslim0.0 22csnyder/hitslim0.0
#docker push 22csnyder/hitslim0.0
#

FROM python:slim

RUN apt-get -y update && apt-get install -y \
    git \
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

