#----------------------------------------
# Use official Ubuntu 18.04 as parent image
#----------------------------------------

#FROM ubuntu:bionic

#----------------------------------------
# Instead, use jupyter/scipy-notebook as
# the parent image so python graphics can
# be accessed via web browser.  This
# parent image is copyrighted by the
# Jupyter Development Team and distributed
# under the terms of the Modified BSD
# License.  The full terms of that license
# are listed in BSD_LICENSE_FOR_JUPYTER.md
#----------------------------------------

# ~3.5GB parent image
FROM jupyter/scipy-notebook

# Switch to root user since default user
# in the jupyter container is jovyan.
USER root

# Set the working directory to /app
# for additional software.
WORKDIR /app

# Add the GMT configuration file
# provided with this Dockerfile.
ADD ConfigUser.cmake .

#----------------------------------------
# Dependencies from Ubuntu repositories
#----------------------------------------
RUN apt-get update && apt-get install -y \
    wget \
    apt-utils \
    git-core \
    gfortran \
    software-properties-common \
    subversion \
    build-essential \
    cmake \
    libcurl4-gnutls-dev \
    libnetcdf-dev \
    libfftw3-dev \
    libpcre3-dev \
    liblapack-dev \
    graphicsmagick \
    ffmpeg \
    tcsh \
    parallel \
    libblas-dev

# For some applications (not mine), GMT
# will use libgdal, but Ubuntu 18.04
# can't find it in apt-get, so commented
# out for now.
#     libgdal1-dev \

#----------------------------------------
# Download and Install GMT and land/coast data
#----------------------------------------
# Following the instructions at: http://gmt.soest.hawaii.edu/projects/gmt/wiki/BuildingGMT#Building-GMT-from-source
# Why from source?  In the past, there were
# some bugs in the standard GMT builds
# available with apt-get. ~1GB
RUN git clone https://github.com/GenericMappingTools/gmt.git; \
    wget ftp://ftp.soest.hawaii.edu/gshhg/gshhg-gmt-2.3.7.tar.gz; \
    wget ftp://ftp.soest.hawaii.edu/dcw/dcw-gmt-1.1.4.tar.gz; \
    mkdir -p /usr/local/src; \
    tar -xvzf gshhg-gmt-2.3.7.tar.gz; \
    mv gshhg-gmt-2.3.7 /usr/local/src; \
    tar -xvzf dcw-gmt-1.1.4.tar.gz; \
    mv dcw-gmt-1.1.4 /usr/local/src; \
    mv ConfigUser.cmake /app/gmt/cmake/ConfigUser.cmake; \
    cd gmt; \
    mkdir build; \
    cd build; \
    cmake ..; \
    make; \
    make install; \
    make clean

#----------------------------------------
# Dependencies for hydrobase (Netcdf 3.6.3, **not** Netcdf 4+)
#----------------------------------------
RUN wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-3.6.3.tar.gz; \
    mkdir -p /usr/local/netcdf3; \
    tar -xvzf netcdf-3.6.3.tar.gz; \
    cd netcdf-3.6.3/; \
    ./configure --prefix=/usr/local/netcdf3; \
    make; \
    make install; \
    make clean; \
    cd ../

#----------------------------------------
# Download and install Hydrobase2 and 3
#----------------------------------------
RUN git clone https://github.com/stefangary/hydrobase2.git; \
    mkdir -p /usr/local/hb2/bin; \
    cd hydrobase2/src; \
    make hydrobase; \
    make qc; \
    make install; \
    make install_qc; \
    make clean; \
    cd ../../

RUN git clone https://github.com/stefangary/hydrobase3.git; \
    mkdir -p /usr/local/hb3/bin; \
    cd hydrobase3/src; \
    make hydrobase; \
    make install; \
    cd ../../

#----------------------------------------
# Download and install Ferret via Miniconda
#----------------------------------------
# If we can't use Miniconda, then there is
# an alternative approach.  In my experience,
# Miniconda seems to be the cleanest way to
# install Ferret. Instructions at:
# https://github.com/NOAA-PMEL/PyFerret/blob/master/README.md
# Instructions for silent installation of
# Miniconda at: https://docs.anaconda.com/anaconda/install/silent-mode/

#=============================
# Miniconda already installed in the
# jupyter/base-notebook container so
# lines immediately below are commented
# out and saved for later.

#RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda3-latest-Linux-x86_64.sh; \
#    chmod a+x ./Miniconda3-latest-Linux-x86_64.sh; \
#    ./Miniconda3-latest-Linux-x86_64.sh -b -p /app/miniconda3; \
#    rm -f *.tar.gz Miniconda3-latest-Linux-x86_64.sh; \
#    eval "$(/app/miniconda3/bin/conda shell.bash hook)"; \
#    conda create --name ferret -c conda-forge pyferret ferret_datasets --yes
#=============================

#=============================
# Instead, we switch back to the
# jovyan user and install pyferret
# and some additional packages.
# The $NB_USER environment variable
# is jovyan.
# These two lines should go back to
# the typical user and working
# directory of the parent container.
WORKDIR /home/jovyan
USER jovyan

# This steps for installing a different version of python
# is based on:
# https://jupyter-docker-stacks.readthedocs.io/en/latest/using/recipes.html#using-pip-install-or-conda-install-in-a-child-docker-image
# which will be 3.8.2 as needed by pyferret.  The default
# version in the jupyter/scipy-notebook is Python 3.7.6.

# Name the new environment and choose Python 3.x version
# Because these are defined as ARG's, you can change them
# on the command line invokation of docker build ...
ARG conda_env=pyferret
ARG py_ver=3.8.2

# Create the new environment and install additional libraries
# As suggested in here: https://jupyter-docker-stacks.readthedocs.io/en/latest/using/recipes.html#using-pip-install-or-conda-install-in-a-child-docker-image
# and thanks to Paolo D. (https://github.com/pdonorio)
# based on https://github.com/jupyter/docker-stacks/issues/43
# add the RISE package from: https://github.com/damianavila/RISE, which is copyrighted by Damian Avila and
# distributed under the terms of the Modified BSD
# License.
RUN conda create --quiet --yes -p $CONDA_DIR/envs/$conda_env python=$py_ver ipython ipykernel ; \ 
    conda install --quiet --yes -p $CONDA_DIR/envs/$conda_env -c damianavila82 rise ; \
    conda install --quiet --yes -p $CONDA_DIR/envs/$conda_env -c conda-forge pyferret ferret_datasets ; \
    conda clean --all -f -y

# Create Python 3.x environment and link it to jupyter
RUN $CONDA_DIR/envs/${conda_env}/bin/python -m ipykernel install --user --name=${conda_env} && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# An additional pip install
RUN $CONDA_DIR/envs/${conda_env}/bin/pip install ferretmagic

# Prepend conda environment to path
ENV PATH $CONDA_DIR/envs/${conda_env}/bin:$PATH

# Make the new environment to be the default one
ENV CONDA_DEFAULT_ENV ${conda_env}

# Somehow Jupyter does not run "conda activate pyferret"
# when starting the notebook which means that the ferret
# paths (usually from /usr/local/ferret/ferret_paths.csh)
# are not set.  Set them manually here (or you could do
# it on the command line at container start up).
# This list comes from the ferret_paths
# setup script and is populated with the values
# from when conda activate pyferret is run in the
# container's jupyter terminal after startup.
# See comments in ferret_paths for what each of these
# actually is.
ENV FER_DIR /opt/conda/envs/pyferret
ENV FER_DSETS /opt/conda/envs/pyferret/share/fer_dsets
ENV FER_DATA . ${FER_DSETS}/data ${FER_DIR}/go ${FER_DIR}/examples
ENV FER_DESCR . ${FER_DSETS}/descr
ENV FER_GRIDS . ${FER_DSETS}/grids
ENV FER_GO . ${FER_DIR}/go ${FER_DIR}/examples ${FER_DIR}/contrib
ENV PYFER_EXTERNAL_FUNCTIONS ${FER_DIR}/ext_func/pylibs
ENV FER_PALETTE . ${FER_DIR}/ppl
ENV FER_FONTS ${FER_DIR}/ppl/fonts

#----------------------------------------
# Done
#----------------------------------------
RUN ["echo", "Done building SOCKS!"]
