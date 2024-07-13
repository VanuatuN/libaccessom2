#!/bin/bash

PLATFORM=$1
if [ -z "$2" ]
then
    FIND_NETCDF=ON
else
    FIND_NETCDF=$2
fi

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# cd $MYDIR && \
# mkdir -p build && \
# cd build && \
# cmake -DCMAKE_C_COMPILER=mpicc -DCMAKE_Fortran_COMPILER=mpifort \
# -DNetCDF_INCLUDE_DIRS=$(nf-config --includedir) \
# -DNetCDF_LIBRARIES=$(nf-config --prefix)/lib/libnetcdff.so -DPLATFORM=$PLATFORM -DFIND_NETCDF=$FIND_NETCDF ../ && \
# make VERBOSE=1 && \
# cd -

export CC=mpicc
export FC=mpifort
#export NETCDF_DIR=/leonardo_scratch/large/userexternal/ntilinin/ACCESS-NRI/release/linux-rhel8-x86_64/intel-2021.2.0/netcdf-fortran-4.5.2-g6pudzj3xc5fglqwz2xkxrr27rflwto3
export NETCDF_DIR=`nf-config --prefix`
export NETCDF_INCLUDE_DIR=`nf-config --includedir`
export NETCDF_LIBRARY=`nf-config --prefix`/lib
export NETCDF_F90_INCLUDE_DIR=`nf-config --includedir`
export NETCDF_F90_LIBRARY=`nf-config --prefix`/lib


cd $MYDIR && \
mkdir -p build && \
cd build && \
cmake -DCMAKE_C_COMPILER=mpicc -DCMAKE_Fortran_COMPILER=mpifort \
      -DPLATFORM=$PLATFORM -DFIND_NETCDF=$FIND_NETCDF ../ && \
make VERBOSE=1 && \
cd -


#      -DNetCDF_INCLUDE_DIRS="$NETCDF_INCLUDE_DIR" \
#      -DNetCDF_LIBRARIES="$NETCDF_LIBRARIES" \
