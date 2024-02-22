######################################
#
#  install parflow
#
#######################################

export INSTALL_DIR=/home/rappl/PFTree
export CMAKE_NETCDF_SILO_DIR=$INSTALL_DIR/cmake_netcdf_silo

# nom de la version parflow 
export PARFLOW_DIR=$INSTALL_DIR/parflow-240212

export NETCDF_DIR=$CMAKE_NETCDF_SILO_DIR/netcdf-parallel-new
export HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/openmpi
export PATH=$NETCDF_DIR/bin:$PATH
export PATH=$CMAKE_NETCDF_SILO_DIR/cmake-dev/bin:$PATH
export PARFLOW_SRC=$INSTALL_DIR/parflow_src

cd $PARFLOW_SRC
rm -rf build; mkdir build
cd build

set -x 
cmake .. \
-DCMAKE_INSTALL_PREFIX=$PARFLOW_DIR \
-DPARFLOW_AMPS_LAYER=mpi1 \
-DPARFLOW_ENABLE_HYPRE=ON \
-DPARFLOW_ENABLE_NETCDF=ON \
-DPARFLOW_ENABLE_SILO:BOOL=ON \
-DNETCDF_INCLUDE_DIR=$NETCDF_DIR/include \
-DNETCDF_LIBRARY=$NETCDF_DIR/lib/libnetcdf.so \
-DPARFLOW_HAVE_CLM=ON

make -j 8
make install



