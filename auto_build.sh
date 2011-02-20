#!/bin/bash


# Get full path to this script
cd `dirname $0`
script_dir=`pwd`


# Get build options
source $script_dir/build_options.sh

if [ -z "$base" ]; then
  echo "build_options.sh did not specify base directory"
  exit 1
fi


install_base=$base/install
xinstall_base=$base/install/cross
git_install_dir=$install_base/git-1.7.3
cmake_install_dir=$install_base/cmake-2.8.3
osmesa_install_dir=$install_base/osmesa-7.6.1
osmesa_xinstall_dir=$xinstall_base/osmesa-7.6.1
python_install_dir=$install_base/python-2.5.2
python_xinstall_dir=$xinstall_base/python-2.5.2
paraview_install_dir=$install_base/paraview
paraview_xinstall_dir=$xinstall_base/paraview

git_command=$git_install_dir/bin/git
cmake_command=$cmake_install_dir/bin/cmake
toolchain_file=$base/toolchains/$toolchain_file

setup_native_compilers()
{
module unload PrgEnv-pgi PrgEnv-gnu Base-opts
}

setup_cross_compilers()
{
module load Base-opts PrgEnv-gnu
}

grab()
{
url=$1
file=$2
cp $script_dir/$file ./
}


do_git()
{
if ! test -x $git_command || test "1" -eq "$rebuild_tools"; then
rm -rf $base/source/git
mkdir -p $base/source/git
cd $base/source/git
package=git-1.7.3
grab http://kernel.org/pub/software/scm/git $package.tar.gz
tar -zxf $package.tar.gz
cd $package
./configure --prefix=$git_install_dir
$make_command && make install
fi
}


do_cmake()
{
if ! test -x $cmake_command || test "1" -eq "$rebuild_tools"; then
rm -rf $base/source/cmake
mkdir -p $base/source/cmake
cd $base/source/cmake

grab $cmake_url $cmake_package.tar.gz
tar -zxf $cmake_package.tar.gz

mkdir build
cd build
../$cmake_package/bootstrap --prefix=$cmake_install_dir
$make_command && make install

# install extra platform files
cp $script_dir/cmake-platform-files/* $cmake_install_dir/share/cmake-2.8/Modules/Platform/
fi
}


do_cmake_git()
{
if ! test -x $cmake_command || test "1" -eq "$rebuild_tools"; then
rm -rf $base/source/cmake
mkdir -p $base/source/cmake
cd $base/source/cmake

$git_command clone -b next git://cmake.org/cmake.git CMakeNext
mkdir build
cd build
../CMakeNext/bootstrap --prefix=$cmake_install_dir
$make_command && make install

# install extra platform files
cp $script_dir/cmake-platform-files/* $cmake_install_dir/share/cmake-2.8/Modules/Platform/
fi
}


do_toolchains()
{
if ! test -d $base/toolchains || test "1" -eq "$rebuild_tools"; then
rm -rf $base/toolchains
mkdir -p $base/toolchains
cd $base/toolchains
fname=`basename $toolchain_file`
cp $script_dir/toolchains/$fname ./
sed -i -e "s|XINSTALL_DIR|$xinstall_base|g" $toolchain_file 
fi
}


do_python_download()
{
if ! test -f $base/source/python/$python_package.tgz || test "1" -eq "$redownload"; then
mkdir -p $base/source/python
cd $base/source/python
grab $python_url $python_package.tgz
rm -rf $python_package
tar -zxf $python_package.tgz
fi
}

do_python_build_native()
{
if ! test -x $python_install_dir/bin/python || test "1" -eq "$rebuild_native_deps"; then
cd $base/source/python
source=$python_package
rm -rf build-native
mkdir build-native
cd build-native
../$source/configure --prefix=$python_install_dir --enable-shared
$make_command && make install
fi
}


do_python_build_cross()
{
if ! test -x $python_xinstall_dir/bin/python || test "1" -eq "$rebuild_cross_deps"; then
cd $base/source/python
source=$python_package
rm -rf $source-cmakeified
cp -r $source $source-cmakeified
source=$source-cmakeified
cp $script_dir/$python_cmake_patch ./
patch -p1 -d $source < $python_cmake_patch

rm -rf build-cross
mkdir build-cross
cd build-cross

# todo - remove PYTHON_BUILD_LIB_SHARED=0
# it is here for bg/p which finds libdl and sets
# build shared default to true, should key off TARGET_SUPPORTS_SHARED_LIBS

$cmake_command \
  -DCMAKE_TOOLCHAIN_FILE=$toolchain_file \
  -DCMAKE_BUILD_TYPE:STRING=Release \
  -DPYTHON_BUILD_LIB_SHARED:BOOL=0 \
  -DWITH_THREAD:BOOL=0 \
  -DHAVE_GETGROUPS:BOOL=0 \
  -DHAVE_SETGROUPS:BOOL=0 \
  -DENABLE_IPV6:BOOL=0 \
  -DCMAKE_INSTALL_PREFIX=$python_xinstall_dir \
  -C ../$source/CMake/TryRunResults-Python-bgl-gcc.cmake \
  ../$source

$make_command && make install
fi
}


do_osmesa_download()
{
if ! test -f $base/source/mesa/$osmesa_package.tar.gz || test "1" -eq "$redownload"; then
mkdir -p $base/source/mesa
cd $base/source/mesa
grab $osmesa_url $osmesa_file.tar.gz

rm -rf $osmesa_file
tar -zxf $osmesa_file.tar.gz
fi
}

do_osmesa_build_native()
{
if ! test -f $osmesa_install_dir/lib/libGLU.so || test "1" -eq "$rebuild_native_deps"; then
cd $base/source/mesa
rm -rf build-native
cp -r $osmesa_package build-native
cd build-native
cp configs/linux-osmesa configs/linux-osmesa.original
cp $script_dir/linux-osmesa configs/linux-osmesa
sed -i.original -e 's|INSTALL_DIR = /usr/local|INSTALL_DIR = '$osmesa_install_dir'|g' configs/default
$make_command linux-osmesa && make install
fi
}

do_osmesa_build_cross()
{
if ! test -f $osmesa_xinstall_dir/lib/libGLU.so || test "1" -eq "$rebuild_cross_deps"; then
cd $base/source/mesa
rm -rf build-cross
cp -r $mesa_package build-cross
cd build-cross

cp $script_dir/$osmesa_config_name configs/
sed -i.original -e 's|linux-osmesa-static|'$osmesa_config_name'|g' Makefile
sed -i.original -e 's|INSTALL_DIR = /usr/local|INSTALL_DIR = '$osmesa_xinstall_dir'|g' configs/default

$make_command $osmesa_config_name && make install
fi
}

do_paraview_download()
{
if ! test -d $base/source/paraview/ParaView || test "1" -eq "$redownload"; then
mkdir -p $base/source/paraview
cd $base/source/paraview
rm -rf ParaView

package=ParaView-3.8.0
grab http://paraview.org/files/v3.8/ParaView-3.8.0.tar.gz $package.tar.gz
tar -zxf $package.tar.gz
mv $package ParaView
fi
}


do_paraview_download_git()
{
if ! test -d $base/source/paraview/ParaView || test "1" -eq "$redownload"; then
mkdir -p $base/source/paraview
cd $base/source/paraview
rm -rf ParaView

paraview_git_url=git://paraview.org/ParaView.git

$git_command clone --recursive $paraview_git_url
cd ParaView


# avoid hooks
mkdir -p .git/hooks/.git
touch .git/hooks/.git/config
mkdir -p VTK/.git/hooks/.git
touch VTK/.git/hooks/.git/config


# get livedata branch
livedata_paraview_url=git://github.com/patmarion/ParaView.git
livedata_vtk_url=git://github.com/patmarion/VTK.git

$git_command remote add livedata $livedata_paraview_url
$git_command fetch livedata
cd VTK
$git_command remote add livedata $livedata_vtk_url
$git_command fetch livedata
cd ..

$git_command checkout -t livedata/live-data --force
$git_command submodule update

# this submodule appeared in the latest git master
rm -rf Utilities/VisItBridge

if [ $platform = bgp ]; then
  # Apply patch to workaround ostream problem
  patch_file=paraview-fix-cswrapper.patch
  cp $script_dir/$patch_file ./
  $git_command apply $patch_file

  # Don't disable HAVE_PTHREAD on bgp
  patch_file=paraview-bgp-have-pthread.patch
  cp $script_dir/$patch_file ./
  $git_command apply $patch_file
fi
if [ $platform = bgl ]; then
  patch_file="bgl-sockets.patch"
  cp $script_dir/$patch_file ./
  $git_command apply $patch_file
fi
fi
}


do_paraview_configure_native()
{
if ! test -f $base/source/paraview/build-native/CMakeCache.txt || test "1" -eq "$rebuild_native_deps"; then
rm -rf $base/source/paraview/build-native
mkdir -p $base/source/paraview/build-native
cd $base/source/paraview/build-native
bash $script_dir/configure_paraview_native.sh ../ParaView $paraview_install_dir $osmesa_install_dir $python_install_dir $cmake_command
fi
}


do_paraview_configure_hosttools()
{
if ! test -f $base/source/paraview/build-hosttools/CMakeCache.txt || test "1" -eq "$rebuild_native_deps"; then
rm -rf $base/source/paraview/build-hosttools
mkdir -p $base/source/paraview/build-hosttools
cd $base/source/paraview/build-hosttools
bash $script_dir/configure_paraview_hosttools.sh ../ParaView $paraview_install_dir $osmesa_install_dir $python_install_dir $cmake_command
fi
}

do_paraview_configure_cross()
{
if ! test -f $base/source/paraview/build-cross/CMakeCache.txt || test "1" -eq "$rebuild_cross_deps"; then
rm -rf $base/source/paraview/build-cross
mkdir -p $base/source/paraview/build-cross
cd $base/source/paraview/build-cross
bash $script_dir/configure_paraview_cross.sh ../ParaView $paraview_xinstall_dir $osmesa_xinstall_dir $python_xinstall_dir $cmake_command $toolchain_file $base/source/paraview/build-hosttools "$paraview_cross_cxx_flags"
fi
}

do_paraview_build_native()
{
cd $base/source/paraview/build-native
export PYTHONHOME=$python_install_dir
export LD_LIBRARY_PATH=$python_install_dir/lib:$LD_LIBRARY_PATH
$make_command
}

do_paraview_build_hosttools()
{
cd $base/source/paraview/build-hosttools
$make_command pvHostTools
}

do_paraview_build_cross()
{
cd $base/source/paraview/build-cross
$make_command
}


do_paraview_native_prereqs()
{
do_git
do_cmake
#do_cmake_git
do_python_download
do_python_build_native
do_osmesa_download
do_osmesa_build_native
#do_paraview_download
do_paraview_download_git
}

do_native()
{
do_paraview_native_prereqs
do_paraview_configure_native
do_paraview_build_native
}

do_cross()
{
#setup_native_compilers
do_paraview_native_prereqs
do_paraview_configure_hosttools
do_paraview_build_hosttools
#setup_cross_compilers

do_toolchains
do_python_build_cross
do_osmesa_build_cross
do_paraview_configure_cross
do_paraview_build_cross
}


# this line is needed so that the "module" command will work
#source /opt/modules/default/init/bash

if [ -z $1 ]
then
  set -x
  echo "Please specify a build step."
  exit 1
else
  set -x
  $1
fi
