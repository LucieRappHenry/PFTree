######################################
#
#  install cmake, netcdf, silo
#
#######################################

export INSTALL_DIR=/home/rappl/pf_test2

#  Install cmake
wget  https://cmake.org/files/v3.18/cmake-3.18.0-rc3.tar.gz
tar -xf cmake-3.18.0-rc3.tar.gz
cd cmake-3.18.0-rc3
./configure --prefix=$INSTALL_DIR/cmake-dev
make -j 8
make install
cd ..


# Install Netcdf FARO
git clone https://github.com/Unidata/netcdf-c.git
cd netcdf-c
# Récupération d'une version plus ancienne
rm h5_test/run_par_tests.sh
rm include/netcdf_dispatch.h
git checkout 2a34eb2a
autoreconf -i
make clean
make distclean
export NETCDF_DIR=$INSTALL_DIR/netcdf-parallel-new
export HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/openmpi
export PATH=$NETCDF_DIR/bin:$PATH
./configure --enable-netcdf-4 --prefix=$NETCDF_DIR \
              CC=mpicc CXX=mpic++ --disable-dap  CPPFLAGS="-I$HDF5_DIR/include" \
              LDFLAGS="-L$HDF5_DIR/lib /usr/lib/x86_64-linux-gnu/libcurl.a "
make -j 8
make install
cd ..

# Install Silo �|  partir du fichier tar
export SILO_DIR=$INSTALL_DIR/silo-4.10.2_install
tar -xvf silo-4.10.2.tar
cd  silo-4.10.2
./configure --disable-silex --prefix=$SILO_DIR
make
make install
cd ..

