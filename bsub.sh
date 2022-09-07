#Run from home directory
LSF_DOCKER_VOLUMES='/storage1/fs1/zaydmanm/Active:/storage1/fs1/zaydmanm/Active /home/csnyder/.ssh:/home/csnyder/.ssh' bsub -Is -G compute-zaydmanm -q general-interactive -a 'docker(22csnyder/hit-slimdoc:0.1)' /bin/bash
