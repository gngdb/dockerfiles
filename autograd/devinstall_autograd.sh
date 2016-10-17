#!/usr/bin/bash
set -xe

cd /root
git clone https://github.com/HIPS/autograd.git
cd autograd
python3 setup.py develop
