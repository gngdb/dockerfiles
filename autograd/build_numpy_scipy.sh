#!/usr/bin/bash

# Adapted from https://github.com/ogrisel/docker-sklearn-openblas

set -xe

# System dependencies
apt-get install -y git-core build-essential gfortran python3-dev curl
curl https://bootstrap.pypa.io/get-pip.py | python3
pip3 install cython

# Temporary build folder
mkdir /tmp/build
cd /tmp/build

# Build NumPy and SciPy from source against OpenBLAS installed
git clone -q --branch=v1.10.1 git://github.com/numpy/numpy.git
cp /numpy-site.cfg numpy/site.cfg
(cd numpy && python3 setup.py install)

git clone -q --branch=v0.16.1 git://github.com/scipy/scipy.git
cp /scipy-site.cfg scipy/site.cfg
(cd scipy && python3 setup.py install)

# Reduce the image size
apt-get autoremove -y
apt-get clean -y

cd /
rm -rf /tmp/build
