#----------------------------------------
# Use official Ubuntu 18.04 as base image
#----------------------------------------

FROM ubuntu:bionic

# Set the working directory to /app

WORKDIR /app

# Add the GMT configuration file
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
# available with apt-get.
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
    make install

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

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda3-latest-Linux-x86_64.sh; \
    chmod a+x ./Miniconda3-latest-Linux-x86_64.sh; \
    ./Miniconda3-latest-Linux-x86_64.sh -b -p /app/miniconda3; \
    rm -f *.tar.gz Miniconda3-latest-Linux-x86_64.sh; \
    eval "$(/app/miniconda3/bin/conda shell.bash hook)"; \
    conda create --name ferret -c conda-forge pyferret ferret_datasets --yes

#----------------------------------------
# Done
#----------------------------------------
CMD ["echo", "Done building SOCKS!"]
