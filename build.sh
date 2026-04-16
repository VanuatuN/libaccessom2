#!/bin/bash

PLATFORM=$1
if [ -z "$2" ]
then
    FIND_NETCDF=ON
else
    FIND_NETCDF=$2
fi

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

NETCDF_DIR="$(nc-config --prefix)"
NETCDF_F90_ROOT="$(nf-config --prefix)"

echo "NETCDF_DIR=$NETCDF_DIR"
echo "NETCDF_F90_ROOT=$NETCDF_F90_ROOT"

cd "$MYDIR" || exit 1
rm -rf build
mkdir -p build
cd build || exit 1

cmake \
  -DPLATFORM="$PLATFORM" \
  -DFIND_NETCDF="$FIND_NETCDF" \
  -DNETCDF_DIR="$NETCDF_DIR" \
  -DNETCDF_F90_ROOT="$NETCDF_F90_ROOT" \
  ../ && \
make VERBOSE=1 && \
cd -