
#platform=bgl
#platform=bgp
#platform=eureka
platform=modern_linux
#platform=jaguarpf
#platform=jaguarpfgcc
set_common_options()
{
  base=$HOME/source/autobuild2
  rebuild_native_deps=0
  rebuild_cross_deps=0
  rebuild_tools=0
  redownload=0
  python_package="Python-2.5.2"
  python_url="http://www.python.org/ftp/python/2.5.2"
  python_cmake_patch="add_cmake_files_to_python2-5-2.patch"
  cmake_package="cmake-2.8.3"
  cmake_url="http://www.cmake.org/files/v2.8"
  osmesa_file="MesaLib-7.6.1" #actual tarball - handle naming inconsistency
  osmesa_package="Mesa-7.6.1"
  osmesa_url="ftp://ftp.freedesktop.org/pub/mesa/7.6.1/"
  skip_python="0"
  threads="-j3"
}
set_bgl_options()
{
  toolchain_file=toolchain-xlc-bgl.cmake
  make_command="make $threads"
  paraview_cross_cxx_flags="-O2 -qstrict -qarch=440 -qtune=440 -qcpluscmt"
  osmesa_config_name=bgl-osmesa-xlc
}



set_bgp_options()
{
  
  toolchain_file=BlueGeneP-xl-static.cmake
  make_command="make $threads"
  paraview_cross_cxx_flags="-O2 -qstrict -qarch=450d -qtune=450 -qcpluscmt"
  osmesa_config_name=bgp-osmesa-xlc
}


set_eureka_options()
{
  make_command="make $threads"
}
set_modern_linux_options()
{
  skip_python="1"
  python_install_dir="/usr"
  make_command="make $threads"
}


set_jaguarpf_options()
{
  base=/ccs/proj/tur013/marionp
  toolchain_file=cray-cnl-pgi-toolchain.cmake
  make_command="make $threads"
  paraview_cross_cxx_flags="-O2"
  osmesa_config_name=craycle-osmesa-pgi
}

set_jaguarpfgcc_options()
{
  base=/ccs/proj/tur013/marionp/gccbuild
  toolchain_file=cray-cnl-gnu-toolchain.cmake
  make_command="make $threads"
  paraview_cross_cxx_flags="-O2"
  osmesa_config_name=craycle-osmesa-gnu
}

set_common_options
set_${platform}_options

