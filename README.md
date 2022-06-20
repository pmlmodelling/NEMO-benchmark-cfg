#NEMO-benchmark-cfg
Set of scripts to facilitate running AMM7 with NEMO4-FABM-ERSEM for benchmarking purposes. 

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

NOTE:- When using the cray compiler, need to add -J flag to FC_MODSEARCH.
For XIOS this is found in xios/tools/FCM/lib/Fcm/Config.pm

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

Next edit the runscript.slurm file ready for the required system and submit. 
