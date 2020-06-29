#!/bin/bash

# Example script for starting socks.
docker run --rm -p 8888:8888 -v /Users/sgary/Desktop/research/socks/scripts:/home/jovyan/work -v /Users/sgary/Desktop/research/data:/home/jovyan/data stefanfgary/socks
