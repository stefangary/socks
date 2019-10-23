# Use official Ubuntu 18.04 as base image

FROM ubuntu:bionic

# Set the working directory to /app

WORKDIR /app

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
    libgdal1-dev \
    libfftw3-dev \
    libpcre3-dev \
    liblapack-dev \
    libblas-dev

# Download GMT
# Following the instructions at: http://gmt.soest.hawaii.edu/projects/gmt/wiki/BuildingGMT#Building-GMT-from-source






# Dependencies for hydrobase (Netcdf 3.6.3, not Netcdf 4+)
RUN wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-3.6.3.tar.gz; \
    mkdir -p /usr/local/netcdf3; \
    tar -xvzf netcdf-3.6.3.tar.gz; \
    cd netcdf-3.6.3/; \
    ./configure --prefix=/usr/local/netcdf3; \
    make; \
    make install; \
    cd ../

# Download and install Hydrobase2 and 3
RUN git clone https://github.com/stefangary/hydrobase2.git; \
    mkdir -p /usr/local/hb2/bin; \
    cd hydrobase2/src; \
    make hydrobase; \
    make qc; \
    make install hydrobase; \
    make install qc; \
    cd ../../

RUN git clone https://github.com/stefanfgary/hydrobase3.git; \
    mkdir -p /usr/local/hb3/bin;
    cd hydrobase3/src; \
    make hydrobase; \
    make install hydrobase; \
    cd ../../

# Install tcdf visualization tools
RUN git clone https://github.com/stefangary/tcdf.git; \
    cd tcdf/src; \
    ./set_tcdf_prefix.sh /usr; \
    make tcdf; \
    make install; \
    cd ../../

CMD ["echo", "Hello from Docker!"]
