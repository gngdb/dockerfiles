apt-get install -y gfortran
export OPENBLAS_ROOT=/opt/OpenBLAS-no-openmp
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OPENBLAS_ROOT/lib
if [ ! -d "OpenBLAS" ]; then
    git clone -q --branch=master git://github.com/xianyi/OpenBLAS.git
    (cd OpenBLAS \
        && make FC=gfortran USE_OPENMP=0 NO_AFFINITY=1 NUM_THREADS=32 \
        && make install PREFIX=$OPENBLAS_ROOT)
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH" >> ~/.bashrc
fi
ldconfig
