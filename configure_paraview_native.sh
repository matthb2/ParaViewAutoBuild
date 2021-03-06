#!/bin/bash

paraview_source_dir=$1
paraview_install_dir=$2
osmesa_install_dir=$3
python_install_dir=$4
cmake_command=$5

use_x=1

$cmake_command \
-DBUILD_SHARED_LIBS=1 \
-DPARAVIEW_USE_MPI=1 \
-DPARAVIEW_ENABLE_PYTHON=1 \
-DPARAVIEW_BUILD_QT_GUI=0 \
-DENABLE_MPI4PY=0 \
-DPARAVIEW_BUILD_PLUGIN_pvblot=0 \
-DVTK_USE_X=$use_x \
-DBUILD_TESTING=0 \
-DPYTHON_EXECUTABLE="$python_install_dir/bin/python" \
-DPYTHON_INCLUDE_DIR="$python_install_dir/include/python2.5" \
-DPYTHON_LIBRARY="$python_install_dir/lib/libpython2.5.so" \
-DVTK_OPENGL_HAS_OSMESA=1 \
-DOSMESA_LIBRARY="$osmesa_install_dir/lib/libOSMesa.so" \
-DOSMESA_INCLUDE_DIR="$osmesa_install_dir/include" \
-DCMAKE_BUILD_TYPE:STRING="Release" \
-DCMAKE_INSTALL_PREFIX:PATH="$paraview_install_dir" \
-DPARAVIEW_ENABLE_COPROCESSING=1 \
-DBUILD_COPROCESSING_ADAPTORS=1 \
-DBUILD_FORTRAN_COPROCESSING_ADAPTORS=1 \
-DBUILD_PYTHON_COPROCESSING_ADAPTOR=1 \
-DBUILD_PHASTA_ADAPTOR=1 \
$paraview_source_dir


#-DOPENGL_INCLUDE_DIR="$osmesa_install_dir/include" \
#-DOPENGL_gl_LIBRARY="" \
#-DOPENGL_glu_LIBRARY="$osmesa_install_dir/lib/libGLU.so" \
