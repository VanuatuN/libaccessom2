#!/bin/bash

source ~/ACCESS-NRI/spack-config/spack-enable.bash
module purge
module load python 
module load intel-oneapi-compilers/2021.2.0-p7vtyvv
module load netcdf-c/4.7.4-d4klyvu
module load netcdf-fortran/4.5.2-5ln2rw2
module load openmpi/4.1.4-ga6avsd
export LD_LIBRARY_PATH=/leonardo/home/userexternal/ntilinin/ACCESS-NRI/release/linux-rhel8-x86_64/intel-2021.2.0/openmpi-4.1.4-ga6avsdxmjya35twagfjts7jp3yahbwt/lib/
unset FC
export FC=mpifort

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export NETCDF_DIR="$(nc-config --prefix)"
export NETCDF_F90_ROOT="$(nf-config --prefix)"
# Args: platform and whether Cmake should search for NetCDF libraries
source $MYDIR/build.sh leo ON


# Repositiories

# json NO
# datetime-fortran NO

# oasis-mct YES
# libaccessom2 YES
# access-om2 YES +
# 
# 