#!/bin/bash

#################################################
# Script to compile XIOS2.5
#################################################

# set compile architecture and export compilers
ARCH=X86_ARCHER2-Cray
export CC=cc export CXX=CC export FC=ftn export F77=ftn export F90=ftn

# Build xios
XIOS_DIR=$CODE_DIR/xios
XIOS_BUILD=$CODE_DIR/xios-build
cd $XIOS_DIR

cd $XIOS_DIR && ./make_xios --prod --arch $ARCH --netcdf_lib netcdf4_par --job 16 --full
rsync -a $XIOS_DIR/bin $XIOS_DIR/inc $XIOS_DIR/lib $XIOS_INSTALL

cd $WORK
