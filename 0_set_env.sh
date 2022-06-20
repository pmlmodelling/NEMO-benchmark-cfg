#!/bin/bash

'''
Load netcdf, hdf5 and cmake modules and set environment variables
'''

module load cray-hdf5-parallel/1.12.0.7
module load cray-netcdf-hdf5parallel/4.7.4.7
module load cmake

export WORK=/path/to/working/dir
export CODE_DIR=$WORK/code

