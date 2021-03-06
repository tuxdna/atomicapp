#!/bin/bash

WHAT=$1

# TODO sanity check that we got docker >= 1.6

[ -z "${WHAT}" ] && echo "Need to provide a distro you want to build for (fedora|centos|rhel7|debian)" && exit
IMAGE_NAME=atomicapp-${WHAT}

if [ -z "$USERNAME" ]; then
    echo "setting USERNAME to " `whoami` 
    USERNAME=`whoami`
fi

echo docker build $USERNAME/$IMAGE_NAME
docker build --rm --tag $USERNAME/$IMAGE_NAME --file Dockerfile.${WHAT} .

#doesn't really make sense to run it
#test
#docker run -it --privileged -v /run:/run -v /:/host -v `pwd`:/application-entity $USERNAME/atomicapp-run /bin/bash
#run
#docker run -dt --privileged -v /run:/run -v /:/host -v `pwd`:/application-entity $USERNAME/atomicapp-run
