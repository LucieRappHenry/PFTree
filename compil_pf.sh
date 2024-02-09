######################################
#
#  install parflow
#
#######################################

export INSTALL_DIR=/home/rappl/PFTree

# nom de la version parflow 
export PARFLOW_DIR=$INSTALL_DIR/parflow-240125

export NETCDF_DIR=$INSTALL_DIR/netcdf-parallel-new
export HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/openmpi
export PATH=$NETCDF_DIR/bin:$PATH
export PATH=$INSTALL_DIR/cmake-dev/bin:$PATH

git clone https://github.com/basileh/parflow.git $INSTALL_DIR/

export PARFLOW_SRC=$INSTALL_DIR/parflow
cd $PARFLOW_SRC
rm -rf build; mkdir build
cd build

set -x 
cmake .. \
 -DCMAKE_INSTALL_PREFIX=$PARFLOW_DIR \
 -DPARFLOW_AMPS_LAYER=mpi1 \
 -DPARFLOW_ENABLE_HYPRE=ON \
 -DPARFLOW_ENABLE_NETCDF=ON \
 -DNETCDF_INCLUDE_DIR=$NETCDF_DIR/include \
 -DNETCDF_LIBRARY=$NETCDF_DIR/lib/libnetcdf.so \
 -DPARFLOW_HAVE_CLM=ON

make -j 8
make install



