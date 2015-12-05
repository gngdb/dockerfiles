FROM kaixhin/cuda:7.0
MAINTAINER Gavin Gray <g.d.b.gray@sms.ed.ac.uk>

# Make sure we're up to date
RUN apt-get update && apt-get install -y
RUN git \
    python-dev \
    python-pip \
    python-nose \

# Install CuDNN (assuming you've put your archive here)
# (thanks kaixhin/cuda-torch-plus)
ADD cudnn*.tgz /root/
RUN cd /root/cudnn* && \
  cp include/*.h /usr/local/cuda/include/ && \
  cp --preserve=links lib64/*.so* /usr/local/cuda/lib64/ && \
  cp lib64/*.a /usr/local/cuda/lib64/

# Compile and install OpenBLAS
ADD install_openblas.sh /root/
RUN chmod +x /root/install_openblas.sh && ./install_openblas.sh

# Use pip to install all the requirements
ADD requirements.txt /root/
RUN pip install -r /root/requirements.txt

# bleeding edge install Lasagne, Theano and Pylearn2
RUN mkdir develop && \
    cd develop && \
    git clone https://github.com/Theano/Theano.git && \
    cd Theano && python setup.py develop && cd .. && \
    git clone https://github.com/Lasagne/Lasagne.git && \
    cd Lasagne && python setup.py develop && cd .. && \
    git clone https://github.com/lisa-lab/pylearn2.git && \
    cd pylearn2 && python setup.py develop 

# Set up environment variables
ENV CUDA_ROOT /usr/local/cuda/bin

# start an ipython server

