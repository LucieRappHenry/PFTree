WARNING : this script considers hdf5 and g++ are already installed.
To check if you have it, you can 'whereis hdf5' in your console for example. If no path is returned, you don't have it.
if not please, copy paste "sudo apt-get install libhdf5-openmpi-dev" for hdf5 or "apt-get install g++" for g++ in your console.

clone this repository in your home :
git clone https://github.com/LucieRappHenry/PFTree.git
cd PFTree

Modify INSTALL_DIR path in install_cmake_netcdf_silo.sh, replacing rappl by your login
Run install_cmake_netcdf_silo.sh

Modify INSTALL_DIR path and PARFLOW_DIR path in compil_pf.sh, replacing rappl by your login
Run compil_pf.sh

If you want to compile an other version of parflow :
Modify the sources
modify PARFLOW_DIR path
Run compil_pf.sh again
