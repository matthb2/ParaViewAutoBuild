
#platform=bgl
#platform=bgp
#platform=eureka
#platform=jaguarpf
platform=jaguarpfgcc

set_bgl_options()
{
  base=$HOME/source/autobuild2
  toolchain_file=toolchain-xlc-bgl.cmake
  make_command="make -j2"
  use_wget=0
  broken_git_install=1
  c_cross_compiler=/opt/ibmcmp/vac/bg/8.0/bin/blrts_xlc
  cxx_cross_compiler=/opt/ibmcmp/vacpp/bg/8.0/bin/blrts_xlC
  paraview_cross_cxx_flags="-O3 -qstrict -qarch=440 -qtune=440 -qcpluscmt"
}



set_bgp_options()
{
  base=/scratch/pmarion/autobuild
  toolchain_file=BlueGeneP-xl-static.cmake
  make_command="make -j2"
  use_wget=0
  broken_git_install=0
  c_cross_compiler=bgxlc
  cxx_cross_compiler=bgxlC
  paraview_cross_cxx_flags="-O3 -qstrict -qarch=450d -qtune=450 -qcpluscmt"
}


set_eureka_options()
{
  base=/scratch/pmarion/test_build
  make_command="make -j2"
  use_wget=0
  broken_git_install=0
}

set_jaguarpf_options()
{
  base=/ccs/proj/tur013/marionp
  toolchain_file=cray-cnl-pgi-toolchain.cmake
  make_command="make -j2"
  use_wget=0
  broken_git_install=0
  c_cross_compiler=cc
  cxx_cross_compiler=CC
  paraview_cross_cxx_flags="-O2"
}

set_jaguarpfgcc_options()
{
  base=/ccs/proj/tur013/marionp/gccbuild
  toolchain_file=cray-cnl-gnu-toolchain.cmake
  make_command="make -j2"
  use_wget=0
  broken_git_install=0
  c_cross_compiler=cc
  cxx_cross_compiler=CC
  paraview_cross_cxx_flags="-O2"
}


set_${platform}_options