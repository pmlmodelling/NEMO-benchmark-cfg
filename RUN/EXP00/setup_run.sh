#!/bin/bash

# Link files for run
cp $CODE_DIR/nemo/cfgs/AMM7_FABM_BENCHMARK/EXP00/nemo nemo.exe
cp $CODE_DIR/xios-build/bin/xios_server.exe .


ln -s $WORK/INPUTS/DOM/coordinates.bdy.nc .
ln -s $WORK/INPUTS/DOM/coordinates.skagbdy.nc .
ln -s $WORK/INPUTS/DOM/domain_cfg.nc .

ln -s $WORK/INPUTS/DOM/restart.nc .
ln -s $WORK/INPUTS/DOM/restart_trc.nc .

ln -s $WORK/INPUTS/RIV/LOCATE_rivers.2005.alk.nc river.nc

mkdir RESTART
