#!/bin/bash

#module purge
#module load intel-compiler/2019.5.281
#module load intel-oneapi-compilers/2023.2.1
#module load netcdf/4.7.4
#module load netcdf-fortran/
#module load openmpi/4.0.2
#module load openmpi/

#module load intel-oneapi-compilers/2023.2.1
#module load openmpi/4.1.4--gcc--11.3.0-cuda-11.8
#module load netcdf-fortran/4.6.0--openmpi--4.1.4--gcc--11.3.0
#module load netcdf-fortran/4.6.1--intel-oneapi-mpi--2021.10.0--oneapi--2023.2.0
#module load netcdf-fortran/4.6.1--gcc--12.2.0
#module load openmpi/
module load access-om2
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo 

# Get the include directory using nf-config
#export NETCDF_INCLUDE_DIRS=$(nf-config --includedir)

# Get the libraries directory using nf-config
#export NETCDF_LIBRARIES=$(nf-config --flibs)
#export NETCDF_HAS_INTERFACES=$(nf-config --has-f90)

# Args: platform and whether Cmake should search for NetCDF libraries
source $MYDIR/build.sh nci OFF
