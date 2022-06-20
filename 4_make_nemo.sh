#!/bin/bash

#############################################
# Build NEMO
#############################################

#Define architecture
ARCH=X86_ARCHER2-Cray_FABM

#Build
export FABM_HOME=$CODE_DIR/fabm-build
export XIOS_HOME=$CODE_DIR/xios-build
NEMO_DIR=$CODE_DIR/nemo
cd $NEMO_DIR

CFG=AMM7_FABM_BENCHMARK
REF=AMM7_FABM
printf 'y\nn\nn\ny\nn\nn\nn\nn\n' |./makenemo -n $CFG -r $REF -m $ARCH -j 0
./makenemo -n $CFG -r $REF -m $ARCH -j 4 clean
./makenemo -n $CFG -r $REF -m $ARCH -j 4 

cd $WORK
