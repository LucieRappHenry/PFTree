######################################
#
#  install cmake, netcdf, silo en local
#
#######################################

export INSTALL_DIR=/home/rappl/PFTree
mkdir $INSTALL_DIR/cmake_netcdf_silo
export CMAKE_NETCDF_SILO_DIR=$INSTALL_DIR/cmake_netcdf_silo
mv $INSTALL_DIR/silo-4.10.2.tar $CMAKE_NETCDF_SILO_DIR/silo-4.10.2.tar
cd $CMAKE_NETCDF_SILO_DIR

#  Install cmake
wget  https://cmake.org/files/v3.18/cmake-3.18.0-rc3.tar.gz
tar -xf cmake-3.18.0-rc3.tar.gz
cd cmake-3.18.0-rc3
# -- -DCMAKE_USE_OPENSSL=OFF is added to prevent any proble with OpenSSL, you can remove it if you don't need to prevent this issue
./configure --prefix=$CMAKE_NETCDF_SILO_DIR/cmake-dev -- -DCMAKE_USE_OPENSSL=OFF

make -j 8
make install
cd $CMAKE_NETCDF_SILO_DIR


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
export NETCDF_DIR=$CMAKE_NETCDF_SILO_DIR/netcdf-parallel-new
export HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/openmpi
export PATH=$NETCDF_DIR/bin:$PATH
./configure --enable-netcdf-4 --prefix=$NETCDF_DIR \
              CC=mpicc CXX=mpic++ --disable-dap  CPPFLAGS="-I$HDF5_DIR/include" \
              LDFLAGS="-L$HDF5_DIR/lib /usr/lib/x86_64-linux-gnu/libcurl.a "
make -j 8
make install
cd $CMAKE_NETCDF_SILO_DIR

# Install Silo a partir du fichier tar
export SILO_DIR=$CMAKE_NETCDF_SILO_DIR/silo-4.10.2_install
tar -xvf silo-4.10.2.tar
cd  silo-4.10.2
./configure --disable-silex --prefix=$SILO_DIR
make
make install
cd $INSTALL_DIR

# Telechargement version de parflow Basile HECTOR
git clone https://github.com/basileh/parflow.git $INSTALL_DIR/parflow_src

# Pour récupérer sorties albedo et changements couleurs (version Mahamadi TABSOBA)

# Pour récupérer sorties albedo et changements couleurs (version Lucie RAPP-HENRY)
