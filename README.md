# socks
Stefan's Oceanographic and Climate toolKit for Students

This repository holds a Dockerfile and documentation for
building a container that holds key software for oceanographic
and climate science applications.  The container image is
available [here](https://hub.docker.com/stefanfgary/socks).

## Instructions for building the image

With Docker already installed,

```bash
 sudo docker build -t stefanfgary/socks .
```

## Instructions for pulling the image

With Docker already installed, all you need to do is:

```bash
sudo docker pull stefanfgary/socks
```

## Instructions for running the image

Launch the image via Docker with:

```bash
docker run -it --rm stefangary/socks /bin/bash
```

## TO DO:

I still need to test how to get the Docker container to display graphics
from Ferret.
