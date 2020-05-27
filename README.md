# SOCKS
Stefan's Oceanographic and Climate Kit for Students

This repository holds a Dockerfile and documentation for
building a container that holds key software for oceanographic
and climate science applications.  The container image is
available [here](https://hub.docker.com/stefanfgary/socks).

This collection of software is the collective work of many
other people; immense thanks to the Jupyter Development
Team, UCAR/Unidata, the GMT development team, NOAA PMEL,
Patrick Brockmann, Ruth Curry, and Damian Avila.  Please see
BIBLIOGRAPHY.md for more detailed reference information.

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
from Ferret.  I think the easiest avenue for this is to start with
the jupyter/scipy-notebook and add the necessary software.  I need to check:
1. the license of jupyter/scipy-notebook,
2. adding ferret into the existing container, and
3. saving the expanded container image and pushing to my personal DockerHub.

## Downloading and running locally

The software container **and** the container "reader" (Docker Desktop) each need to be downloaded onto your computer.  Expect this to take at least about ~10GB when installed on your computer.  The downloads themselves are about ~3GB total.

1. Install Docker Desktop for [Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac) or [Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows). If you're running Linux, install Docker Engine via [these instructions](https://docs.docker.com/engine/install/ubuntu).

2. Open a Terminal and type:

```bash
docker pull jupyter/scipy-notebook
```

3. Run the jupyter/scipy-notebook container.  The following command line comes from the [Jupyter Docker Stacks documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html).

To just run the container,

docker run -p 8888:8888 jupyter/scipy-notebook

To run the container mounting local directory:

*NIX, Mac, Win


