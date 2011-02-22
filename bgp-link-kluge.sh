BASEDIR=$PWD

buildbase=$1
cd $buildbase//source/paraview/build-cross/Utilities/VTKPythonWrapping/Executable

/gpfs/software/linux-sles10-ppc64/apps/ibmcmp-dec2010/vacpp/bg/9.0/bin/bgxlC  -Wl,-relax -O2 -qstrict -qarch=450d -qtune=450 -qcpluscmt -O -DNDEBUG   CMakeFiles/pvbatch.dir/pvbatch.cxx.o  -o ../../../bin/pvbatch  ../../../bin/libvtkPVPython.a ../../../bin/libvtkPVServerManagerPythonD.a ../../../bin/libvtkPVPythonInterpretor.a ../../../bin/libvtkPVServerManager.a ../../../bin/libvtkPVFiltersPython.a ../../../bin/libvtkPVServerManagerPython.a ../../../bin/libvtkPVFiltersCS.a ../../../bin/libvtkPVFiltersPythonD.a ../../../bin/libvtkPVFilters.a ../../../bin/libvtkPVServerManagerPythonD.a ../../../bin/libvtkPVPythonInterpretor.a ../../../bin/libvtkPVServerManager.a ../../../bin/libvtkPVFiltersPython.a ../../../bin/libvtkPVServerManagerPython.a ../../../bin/libvtkPVFiltersCS.a ../../../bin/libvtkPVFiltersPythonD.a ../../../bin/libvtkPVFilters.a ../../../bin/libvtkCommonPython.a ../../../bin/libvtkFilteringPython.a ../../../bin/libvtkImagingPython.a ../../../bin/libvtkGraphicsPython.a ../../../bin/libvtkGenericFilteringPython.a ../../../bin/libvtkGenericFilteringPythonD.a ../../../bin/libvtkIOPython.a ../../../bin/libvtkRenderingPython.a ../../../bin/libvtkVolumeRenderingPython.a ../../../bin/libvtkVolumeRenderingPythonD.a ../../../bin/libvtkHybridPython.a ../../../bin/libvtkWidgetsPython.a ../../../bin/libvtkParallelPython.a ../../../bin/libvtkInfovisPython.a ../../../bin/libvtkGeovisPython.a ../../../bin/libvtkGeovisPythonD.a ../../../bin/libvtkGeovis.a ../../../bin/libvtkproj4.a ../../../bin/libvtkViewsPython.a ../../../bin/libvtkChartsPython.a ../../../bin/libvtkChartsPythonD.a ../../../bin/libvtkViewsPythonD.a ../../../bin/libvtkInfovisPythonD.a ../../../bin/libvtkCharts.a ../../../bin/libvtkViews.a ../../../bin/libvtkPVServerCommonPython.a ../../../bin/libvtkPVServerCommonPythonD.a ../../../bin/libvtkWidgetsPythonD.a ../../../bin/libvtkHybridPythonD.a ../../../bin/libvtkParallelPythonD.a ../../../bin/libvtkIOPythonD.a ../../../bin/libvtkRenderingPythonD.a ../../../bin/libvtkImagingPythonD.a ../../../bin/libvtkGraphicsPythonD.a ../../../bin/libvtkFilteringPythonD.a ../../../bin/libvtkCommonPythonD.a ../../../bin/libvtkPythonCore.a ../../../bin/libvtkXdmfCS.a ../../../bin/libvtkXdmf.a ../../../bin/libXdmf.a ../../../bin/libvtkPVServerCommonCS.a ../../../bin/libvtkPVServerCommon.a ../../../bin/libKWCommon.a ../../../bin/libvtkInfovisCS.a ../../../bin/libvtkInfovis.a ../../../bin/libvtklibxml2.a ../../../bin/libvtkalglib.a ../../../bin/libvtkPVCommandOptions.a ../../../bin/libvtkVolumeRenderingCS.a ../../../bin/libvtkVolumeRendering.a ../../../bin/libvtkWidgetsCS.a ../../../bin/libvtkHybridCS.a ../../../bin/libvtkParallelCS.a ../../../bin/libvtkRenderingCS.a ../../../bin/libvtkGenericFilteringCS.a ../../../bin/libvtkGenericFiltering.a ../../../bin/libvtkGraphicsCS.a ../../../bin/libvtkImagingCS.a ../../../bin/libvtkIOCS.a ../../../bin/libvtkFilteringCS.a ../../../bin/libvtkCommonCS.a ../../../bin/libvtkClientServer.a ../../../bin/libvtkWidgets.a ../../../bin/libvtkHybrid.a ../../../bin/libvtkParallel.a ../../../bin/libvtkRendering.a ../../../bin/libvtkIO.a ../../../bin/libvtkDICOMParser.a ../../../bin/libvtkmetaio.a ../../../bin/libvtksqlite.a ../../../bin/libvtkpng.a ../../../bin/libvtktiff.a ../../../bin/libvtkjpeg.a ../../../bin/libvtkexpat.a ../../../bin/libvtkGraphics.a ../../../bin/libvtkverdict.a ../../../bin/libvtkImaging.a ../../../bin/libvtkFiltering.a ../../../bin/libVPIC.a ../../../bin/libCosmo.a ../../../bin/libvtkCommon.a -lm -lpthread ../../../bin/libvtksys.a -ldl ../../../bin/libvtkftgl.a ../../../bin/libvtkfreetype.a ../../../bin/libvtkexoIIc.a ../../../bin/libvtkNetCDF.a ../../../bin/libvtkhdf5.a ../../../bin/libvtkzlib.a -lm ../../../bin/libicet_mpi.a ../../../bin/libicet_strategies.a ../../../bin/libicet.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/comm/default/lib/libcxxmpich.cnk.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/comm/default/lib/libmpich.cnk.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/comm/default/lib/libopa.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/comm/sys/lib/libdcmf.cnk.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/comm/sys/lib/libdcmfcoll.cnk.a /bgsys/drivers/ppcfloor/gnu-linux/powerpc-bgp-linux/lib/libpthread.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/runtime/SPI/libSPI.cna.a /bgsys/drivers/ppcfloor/gnu-linux/powerpc-bgp-linux/lib/librt.a $buildbase//install/cross/osmesa-7.6.1/lib/libOSMesa.a $buildbase//install/cross/python-2.5.2/lib/libpython2.5.a /bgsys/drivers/ppcfloor/gnu-linux/powerpc-bgp-linux/lib/libutil.a -ldl -lm -lpthread


/gpfs/software/linux-sles10-ppc64/apps/ibmcmp-dec2010/vacpp/bg/9.0/bin/bgxlC  -Wl,-relax -O2 -qstrict -qarch=450d -qtune=450 -qcpluscmt -O -DNDEBUG   CMakeFiles/pvpython.dir/pvpython.cxx.o  -o ../../../bin/pvpython  ../../../bin/libvtkPVPython.a ../../../bin/libvtkPVServerManagerPythonD.a ../../../bin/libvtkPVPythonInterpretor.a ../../../bin/libvtkPVServerManager.a ../../../bin/libvtkPVFiltersPython.a ../../../bin/libvtkPVServerManagerPython.a ../../../bin/libvtkPVFiltersCS.a ../../../bin/libvtkPVFiltersPythonD.a ../../../bin/libvtkPVFilters.a ../../../bin/libvtkPVServerManagerPythonD.a ../../../bin/libvtkPVPythonInterpretor.a ../../../bin/libvtkPVServerManager.a ../../../bin/libvtkPVFiltersPython.a ../../../bin/libvtkPVServerManagerPython.a ../../../bin/libvtkPVFiltersCS.a ../../../bin/libvtkPVFiltersPythonD.a ../../../bin/libvtkPVFilters.a ../../../bin/libvtkCommonPython.a ../../../bin/libvtkFilteringPython.a ../../../bin/libvtkImagingPython.a ../../../bin/libvtkGraphicsPython.a ../../../bin/libvtkGenericFilteringPython.a ../../../bin/libvtkGenericFilteringPythonD.a ../../../bin/libvtkIOPython.a ../../../bin/libvtkRenderingPython.a ../../../bin/libvtkVolumeRenderingPython.a ../../../bin/libvtkVolumeRenderingPythonD.a ../../../bin/libvtkHybridPython.a ../../../bin/libvtkWidgetsPython.a ../../../bin/libvtkParallelPython.a ../../../bin/libvtkInfovisPython.a ../../../bin/libvtkGeovisPython.a ../../../bin/libvtkGeovisPythonD.a ../../../bin/libvtkGeovis.a ../../../bin/libvtkproj4.a ../../../bin/libvtkViewsPython.a ../../../bin/libvtkChartsPython.a ../../../bin/libvtkChartsPythonD.a ../../../bin/libvtkViewsPythonD.a ../../../bin/libvtkInfovisPythonD.a ../../../bin/libvtkCharts.a ../../../bin/libvtkViews.a ../../../bin/libvtkPVServerCommonPython.a ../../../bin/libvtkPVServerCommonPythonD.a ../../../bin/libvtkWidgetsPythonD.a ../../../bin/libvtkHybridPythonD.a ../../../bin/libvtkParallelPythonD.a ../../../bin/libvtkIOPythonD.a ../../../bin/libvtkRenderingPythonD.a ../../../bin/libvtkImagingPythonD.a ../../../bin/libvtkGraphicsPythonD.a ../../../bin/libvtkFilteringPythonD.a ../../../bin/libvtkCommonPythonD.a ../../../bin/libvtkPythonCore.a ../../../bin/libvtkXdmfCS.a ../../../bin/libvtkXdmf.a ../../../bin/libXdmf.a ../../../bin/libvtkPVServerCommonCS.a ../../../bin/libvtkPVServerCommon.a ../../../bin/libKWCommon.a ../../../bin/libvtkInfovisCS.a ../../../bin/libvtkInfovis.a ../../../bin/libvtklibxml2.a ../../../bin/libvtkalglib.a ../../../bin/libvtkPVCommandOptions.a ../../../bin/libvtkVolumeRenderingCS.a ../../../bin/libvtkVolumeRendering.a ../../../bin/libvtkWidgetsCS.a ../../../bin/libvtkHybridCS.a ../../../bin/libvtkParallelCS.a ../../../bin/libvtkRenderingCS.a ../../../bin/libvtkGenericFilteringCS.a ../../../bin/libvtkGenericFiltering.a ../../../bin/libvtkGraphicsCS.a ../../../bin/libvtkImagingCS.a ../../../bin/libvtkIOCS.a ../../../bin/libvtkFilteringCS.a ../../../bin/libvtkCommonCS.a ../../../bin/libvtkClientServer.a ../../../bin/libvtkWidgets.a ../../../bin/libvtkHybrid.a ../../../bin/libvtkParallel.a ../../../bin/libvtkRendering.a ../../../bin/libvtkIO.a ../../../bin/libvtkDICOMParser.a ../../../bin/libvtkmetaio.a ../../../bin/libvtksqlite.a ../../../bin/libvtkpng.a ../../../bin/libvtktiff.a ../../../bin/libvtkjpeg.a ../../../bin/libvtkexpat.a ../../../bin/libvtkGraphics.a ../../../bin/libvtkverdict.a ../../../bin/libvtkImaging.a ../../../bin/libvtkFiltering.a ../../../bin/libVPIC.a ../../../bin/libCosmo.a ../../../bin/libvtkCommon.a -lm -lpthread ../../../bin/libvtksys.a -ldl ../../../bin/libvtkftgl.a ../../../bin/libvtkfreetype.a ../../../bin/libvtkexoIIc.a ../../../bin/libvtkNetCDF.a ../../../bin/libvtkhdf5.a ../../../bin/libvtkzlib.a -lm ../../../bin/libicet_mpi.a ../../../bin/libicet_strategies.a ../../../bin/libicet.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/comm/default/lib/libcxxmpich.cnk.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/comm/default/lib/libmpich.cnk.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/comm/default/lib/libopa.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/comm/sys/lib/libdcmf.cnk.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/comm/sys/lib/libdcmfcoll.cnk.a /bgsys/drivers/ppcfloor/gnu-linux/powerpc-bgp-linux/lib/libpthread.a /bgsys/drivers/V1R4M2_200_2010-100508P/ppc/runtime/SPI/libSPI.cna.a /bgsys/drivers/ppcfloor/gnu-linux/powerpc-bgp-linux/lib/librt.a $buildbase//install/cross/osmesa-7.6.1/lib/libOSMesa.a $buildbase//install/cross/python-2.5.2/lib/libpython2.5.a /bgsys/drivers/ppcfloor/gnu-linux/powerpc-bgp-linux/lib/libutil.a -ldl -lm -lpthread

cd $BASEDIR

cd $buildbase//source/paraview/build-cross/CoProcessing/CoProcessor

/gpfs/software/linux-sles10-ppc64/apps/ibmcmp-dec2010/vacpp/bg/9.0/bin/bgxlC  -+ -DVTK_PYTHON_BUILD -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -D_SCL_SECURE_NO_DEPRECATE -DMPICH_IGNORE_CXX_SEEK -O2 -qstrict -qarch=450d -qtune=450 -qcpluscmt -O -DNDEBUG -I/bgsys/drivers/ppcfloor/arch/include -I$buildbase//source/paraview/ParaView/CoProcessing/CoProcessor -I$buildbase//source/paraview/build-cross -I$buildbase//source/paraview/build-cross/VTK/Utilities -I$buildbase//install/cross/python-2.5.2/include/python2.5 -I$buildbase//source/paraview/ParaView/Utilities/VTKClientServer -I$buildbase//source/paraview/ParaView/Common/KWCommon -I$buildbase//source/paraview/ParaView/Servers/Filters -I$buildbase//source/paraview/ParaView/Servers/ServerManager -I$buildbase//source/paraview/ParaView/Servers/Common -I$buildbase//source/paraview/ParaView/Utilities/VTKPythonWrapping/Executable -I$buildbase//source/paraview/ParaView/VTK/Wrapping -I$buildbase//source/paraview/build-cross/VTK/Wrapping -I$buildbase//source/paraview/build-cross/Utilities/VTKClientServer -I$buildbase//source/paraview/build-cross/Servers/Filters -I$buildbase//source/paraview/build-cross/Servers/ServerManager -I$buildbase//source/paraview/build-cross/Servers/Common -I$buildbase//source/paraview/ParaView/Utilities/Xdmf2/vtk -I$buildbase//source/paraview/build-cross/Utilities/Xdmf2/vtk -I$buildbase//source/paraview/ParaView/Utilities/hdf5 -I$buildbase//source/paraview/build-cross/Utilities/hdf5 -I$buildbase//source/paraview/ParaView/VTK/GUISupport/Qt -I$buildbase//source/paraview/build-cross/VTK/GUISupport/Qt -I$buildbase//source/paraview/ParaView/Qt/Widgets -I$buildbase//source/paraview/build-cross/Qt/Widgets -I$buildbase//source/paraview/ParaView/Qt/Chart -I$buildbase//source/paraview/build-cross/Qt/Chart -I$buildbase//source/paraview/ParaView/Qt/Core -I$buildbase//source/paraview/build-cross/Qt/Core -I$buildbase//source/paraview/build-cross/Qt/Core/Resources/UI -I$buildbase//source/paraview/ParaView/Qt/Components -I$buildbase//source/paraview/build-cross/Qt/Components -I$buildbase//source/paraview/build-cross/Qt/Components/Resources/UI -I$buildbase//source/paraview/ParaView/Qt/ApplicationComponents -I$buildbase//source/paraview/build-cross/Qt/ApplicationComponents -I$buildbase//source/paraview/build-cross/Qt/ApplicationComponents/Resources/UI -I$buildbase//source/paraview/ParaView/Qt/Testing -I$buildbase//source/paraview/build-cross/Qt/Testing -I$buildbase//source/paraview/ParaView/Qt/Python -I$buildbase//source/paraview/build-cross/Qt/Python -I$buildbase//source/paraview/ParaView/VTK -I$buildbase//source/paraview/build-cross/VTK -I$buildbase//source/paraview/ParaView/VTK/Utilities -I$buildbase//source/paraview/ParaView/VTK/Wrapping/Python -I$buildbase//source/paraview/build-cross/VTK/Wrapping/Python -I$buildbase//source/paraview/ParaView/VTK/Common -I$buildbase//source/paraview/build-cross/VTK/Common -I$buildbase//source/paraview/ParaView/VTK/Charts -I$buildbase//source/paraview/build-cross/VTK/Charts -I$buildbase//source/paraview/ParaView/VTK/Filtering -I$buildbase//source/paraview/build-cross/VTK/Filtering -I$buildbase//source/paraview/ParaView/VTK/GenericFiltering -I$buildbase//source/paraview/build-cross/VTK/GenericFiltering -I$buildbase//source/paraview/ParaView/VTK/IO -I$buildbase//source/paraview/build-cross/VTK/IO -I$buildbase//source/paraview/ParaView/VTK/Imaging -I$buildbase//source/paraview/build-cross/VTK/Imaging -I$buildbase//source/paraview/ParaView/VTK/Rendering -I$buildbase//source/paraview/build-cross/VTK/Rendering -I$buildbase//source/paraview/ParaView/VTK/Parallel -I$buildbase//source/paraview/build-cross/VTK/Parallel -I$buildbase//source/paraview/ParaView/VTK/Graphics -I$buildbase//source/paraview/build-cross/VTK/Graphics -I$buildbase//source/paraview/ParaView/VTK/Hybrid -I$buildbase//source/paraview/build-cross/VTK/Hybrid -I$buildbase//source/paraview/ParaView/VTK/VolumeRendering -I$buildbase//source/paraview/build-cross/VTK/VolumeRendering -I$buildbase//source/paraview/ParaView/VTK/Widgets -I$buildbase//source/paraview/build-cross/VTK/Widgets -I$buildbase//source/paraview/ParaView/VTK/Infovis -I$buildbase//source/paraview/build-cross/VTK/Infovis -I$buildbase//source/paraview/ParaView/VTK/Views -I$buildbase//source/paraview/build-cross/VTK/Views -I$buildbase//source/paraview/build-cross/CoProcessing/CoProcessor   -o CMakeFiles/vtkCoProcessor.dir/vtkCPPartitionHelper.cxx.o -c $buildbase//source/paraview/ParaView/CoProcessing/CoProcessor/vtkCPPartitionHelper.cxx -ldl -lm -lpthread

cd $BASEDIR