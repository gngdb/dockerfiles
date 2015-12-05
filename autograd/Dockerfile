FROM ogrisel/openblas
MAINTAINER Gavin Gray <g.d.b.gray@sms.ed.ac.uk>

# Apt-get dependencies
RUN apt-get install -y libfreetype6-dev libpng12-dev libxft-dev

# Install numpy and scipy with OpenBLAS
ADD numpy-site.cfg numpy-site.cfg
ADD scipy-site.cfg scipy-site.cfg
ADD build_numpy_scipy.sh build_numpy_scipy.sh
RUN bash build_numpy_scipy.sh

# Install other dependencies for repo
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt 

# Install in develop mode
ADD devinstall_autograd.sh devinstall_autograd.sh
RUN bash devinstall_autograd.sh

# To make is easier to attach a volume for interactive use
RUN mkdir -p /mnt/workdir
WORKDIR /mnt/workdir
