Docker image with the Galil EPICS Module installed 
==================================================================

This repository contains a Dockerfile used to create a Docker image with the
[Galil EPICS Module](https://github.com/motorapp/Galil-3-0).

The module is an ASYN based EPICS driver for Galil products. 

## Running the Docker Container

The simples way to run the container is to run:

    docker run --rm -it --net host lnlsdig/galil-epics-module

## Creating a Persistent Container

If you want to create a persistent container with the module, you can run a
command similar to:

    docker run -it --net host --restart always --name CONTAINER_NAME lnlsdig/galil-epics-module

where `CONTAINER_NAME` is the name given to the container.

## Building the Image Manually

To build the image locally without downloading it from Docker Hub, clone the
repository and run the `docker build` command:

    git clone https://github.com/lnls-dig/docker-galil-epics-module
    docker build -t lnlsdig/galil-epics-module docker-galil-epics-module
