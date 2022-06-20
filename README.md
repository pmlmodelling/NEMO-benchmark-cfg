#NEMO-benchmark-cfg
Set of scripts to facilitate running AMM7 with NEMO4-FABM-ERSEM for benchmarking purposes. There are four elements to the code;
- XIOS: an I/O library
- ERSEM: Biogeochemical model code (does not require compilation)
- FABM: Interface between ERSEM and NEMO
- NEMO: Ocean circulation model
Compilation will require the parallel netcdf and hdf5 libraries for fortran, cmake, make, c++ and fortran compilers. 

COMPILATION
===========
The following scripts can assist with compiling the NEMO code. Both XIOS and FABM need to be compiled before NEMO.

0_set_env.sh
------------
Load required modules and set path to working directory

1_clone_repositories.sh
-----------------------
Clone codes for XIOS, ERSEM, FABM and NEMO

2_make_xios.sh
--------------
Compiles the xios code. Before compilation, please set the compilers and architecture at the top of this script. The architecture files for the compiler {.env, .fcm, .path} need to be added to the xios/arch directory, for examples see example_architectures/xios.

NOTE:- When using the cray compiler, the first compile may fail due to a missing -J flag for FC_MODSEARCH. This file is created in xios/tools/FCM/lib/Fcm/Config.pm, which is created during the first compile

3_make_fabm.sh
---------------
Compiles FABM ready for NEMO, using the ERSEM code. Before compilation please set the fortran compiler at the top of this script

4_make_nemo.sh
--------------
Compiles NEMO. Before compilation please add an architecture to the nemo/arch directory, and set at the top of this script. Note that the fcm script will need to include the non-standard flags for FABM, see example_architectures/nemo. 

NOTE:- As with XIOS, for the cray compiler the -J flag is needed in FC_MODSEARCH, located in nemo/ext/FCM/lib/Fcm/Config.pm

RUNNING A SIMULATION
====================

Download input files
--------------------
Input files are available from the PML onedrive, and should be placed into a folder called INPUTS in the working directory.

Perform a simulation
--------------------
Simulations are performed in the RUN/EXP00 directory. Before the first simulation please run setup_run.sh, which will link the executables from the compiled code and link some core files from the INPUTS directory. 

Next edit the runscript.slurm file ready for the required system and submit. The provided runscript details a typical Archer2 submission, using 12 nodes of 128 cores. Each node has a single XIOS server occupying 16 cores, with 1212 cores dedicated to running the ocean simulation. Due to the dense population of cores per node on Archer2, a space is left every 12th core. This results in a more complex submission script. 

Using 1200 cores for the ocean is around maximum for performance for the simulation and takes approximately 15 minutes of run time. Provided in this repository are sample outputs from the Archer2 run, alongside an image for sanity checking the run output;
ocean.output: main log file of the run.
timing.output: contains information of various timings and performance.
slurm.out: standard out/error file, also contains some memory performance information.
chlorophyll.eps: Plot of surface chlorophyll at the end of the simulation.
plot_surface_chl.py: Simple python script that can be used to plot the above image.

It is desirable for these to be provided alongside the benchmarking performance results.

