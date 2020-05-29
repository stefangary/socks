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

## Downloading and running locally

The software container **and** the container "reader"
(Docker Desktop) each need to be downloaded onto your
computer.  Expect this to take at least about ~10GB when
installed on your computer.  The downloads themselves are
about ~3GB total.

1. Install Docker Desktop for [Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac) or [Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows). If you're running Linux, install Docker Engine via [these instructions](https://docs.docker.com/engine/install/ubuntu).
Most Linux users will need to prefix all `docker` commands with
`sudo` but that's not required in Windows and OSX.

2. Get the container **image** by opening a terminal (e.g. the Terminal app for OSX or PowerShell in Windows 10 are aleady installed) and typing:

```bash
docker pull stefanfgary/socks
```

3. Run a container based on the container image.  The following
command line is based on the [Jupyter Docker Stacks documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html).
Note that you'll want to change the path of the directory to
mount into the container to match whichever operating system
you're using and the name of an actual directory on your
host computer.  The file paths provided here are **examples**
and are unlikely to work verbatium.

- For Windows 10:

```bash
docker run --rm -p 8888:8888 -v C:\Users\sfg\work:/home/jovyan/work stefanfgary/socks
```

- For OSX:
```bash
docker run --rm -p 8888:8888 -v /Users/sfg/work:/home/jovyan/work stefanfgary/socks
```

- For Linux:
```bash
docker run --rm -p 8888:8888 -v /home/sfg/work:/home/jovyan/work stefanfgary/socks
```

- The `--rm` option means that the container that is created
from the container image is deleted when it stops running.
(See below for why this is not a problem.)
- The `-p` flag sets which port in the container is talking
to which port on the computer.
- The `-v` flag mounts a directory on the host computer
to the directory `/home/jovyan/work` inside the container.
This `/home/jovyan/work` is the default working directory
in the container and all files are shared between the host
computer and the container here.  Save your work in
`/home/jovyan/work` and not elsewhere in the container because
the container may be deleted later.
- To stay organized, you can mount more than one directory into
the container and/or you can mount different folders.  Just don't
try to mount two directories on the host computer to the same
place in the container!

4. Finally, access the Jupyter notebook interface by copying
and pasting the link at the bottom of your terminal window into
a web browser's address bar.

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

## Instructions for running a terminal within the container

Launch the image via Docker with:

```bash
docker run -it --rm stefangary/socks /bin/bash
```
