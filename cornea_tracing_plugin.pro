
#an example plugin project file
TEMPLATE	= lib
CONFIG	+= qt plugin warn_off
#CONFIG	+= x86_64

#set the Vaa3D main path
V3DMAINPATH   =  /Users/valentina/projects/Vaa3dbuild_new/v3d_external/v3d_main
VAA3DPATH     =  /Users/valentina/projects/Vaa3dbuild_new/v3d_external
V3D_PLUGINS   =  /Users/valentina/projects/Vaa3dbuild_new/vaa3d_tools/released_plugins/v3d_plugins
QT_DIR        =  /usr/local/Trolltech/Qt-4.7.1
QT_SHARED_FOLDER = $$QT_DIR/demos/shared # for arthurwidgets


#include necessary paths
INCLUDEPATH	+= $$V3DMAINPATH/basic_c_fun
INCLUDEPATH += $$V3DMAINPATH/common_lib/include
INCLUDEPATH += $$V3D_PLUGINS/ada_threshold
INCLUDEPATH += $$QT_SHARED_FOLDER
INCLUDEPATH += $$V3DMAINPATH/v3d
# including paths needed for SIGEN plugin
INCLUDEPATH += $$V3D_PLUGINS/bigneuron_hide_ikeno_SIGEN/src
INCLUDEPATH += $$V3D_PLUGINS/bigneuron_hide_ikeno_SIGEN/third_party
INCLUDEPATH += $$V3D_PLUGINS/bigneuron_hide_ikeno_SIGEN/src/sigen
INCLUDEPATH += $$VAA3DPATH/v3d_main/common_lib/include
INCLUDEPATH += $$V3DMAINPATH/3drenderer
INCLUDEPATH += $$V3DMAINPATH/jba/c++
INCLUDEPATH += $$V3DMAINPATH/neuron_editing


LIBS += -L. -lv3dtiff -L$$V3DMAINPATH/common_lib/lib

#include the headers used in the project
HEADERS	+= cornea_tracing_plugin.h
HEADERS	+= example_func.h
HEADERS += ada_thresholding.h
HEADERS += full_tracing.h
#HEADERS += $$V3DMAINPATH/v3d/mainwindow.h
#HEADERS += $$V3DMAINPATH/3drenderer/v3dr_mainwindow.h
#HEADERS += $$V3DMAINPATH/3drenderer/v3dr_glwidget.h
#HEADERS += $$V3DMAINPATH/3drenderer/qtr_widget.h


macx{
    LIBS += -L$$V3DMAINPATH/jba/c++ -lv3dnewmat
#    CONFIG += x86_64
}

win32{
    LIBS += -L$$V3DMAINPATH/common_lib/winlib64 -llibnewmat
}

unix:!macx {
    LIBS += -L$$V3DMAINPATH/jba/c++ -lv3dnewmat
}


#include the source files used in the project
SOURCES	+= cornea_tracing_plugin.cpp
SOURCES	+= example_func.cpp
SOURCES	+= $$V3DMAINPATH/basic_c_fun/v3d_message.cpp
SOURCES += $$V3DMAINPATH/basic_c_fun/stackutil.cpp
SOURCES += $$V3DMAINPATH/basic_c_fun/mg_image_lib.cpp
SOURCES += $$V3DMAINPATH/basic_c_fun/mg_utilities.cpp
SOURCES += $$V3DMAINPATH/basic_c_fun/basic_memory.cpp
SOURCES += $$V3DMAINPATH/basic_c_fun/basic_surf_objs.cpp
SOURCES += ada_thresholding.cpp
#SOURCES += $$V3DMAINPATH/v3d/my4dimage.cpp
#SOURCES += $$V3D_PLUGINS/ada_threshold/moc_ada_threshold.cpp
SOURCES += $$V3DMAINPATH/jba/c++/histeq.cpp
SOURCES += $$V3DMAINPATH/neuron_editing/v_neuronswc.cpp
#SOURCES += $$V3DMAINPATH/v3d/mainwindow.cpp
#SOURCES += $$V3DMAINPATH/v3d/mainwindow_interface.cpp
#SOURCES += $$V3DMAINPATH/v3d/mainwindow_wsi.cpp
#SOURCES += $$V3DMAINPATH/v3d/*
#SOURCES += $$V3DMAINPATH/v3d/mdichild.cpp
#SOURCES += $$V3DMAINPATH/v3d/3drenderer/v3dr_mainwindow.cpp
#SOURCES += $$V3DMAINPATH/v3d/3drenderer/v3dr_glwidget.cpp

## Source files needed for SIGEN
SOURCES += SIGEN.cpp
SOURCES += full_tracing.cpp

SOURCES += $$V3D_PLUGINS/bigneuron_hide_ikeno_SIGEN/src/sigen/common/neuron.cpp
SOURCES += $$V3D_PLUGINS/bigneuron_hide_ikeno_SIGEN/src/sigen/interface.cpp
SOURCES += $$V3D_PLUGINS/bigneuron_hide_ikeno_SIGEN/src/sigen/extractor/extractor.cpp
SOURCES += $$V3D_PLUGINS/bigneuron_hide_ikeno_SIGEN/src/sigen/builder/builder.cpp
SOURCES += $$V3D_PLUGINS/bigneuron_hide_ikeno_SIGEN/src/sigen/toolbox/toolbox.cpp
SOURCES += $$V3D_PLUGINS/bigneuron_hide_ikeno_SIGEN/src/sigen/common/disjoint_set.cpp
SOURCES += $$V3D_PLUGINS/bigneuron_hide_ikeno_SIGEN/third_party/kdtree/kdtree.c





#specify target name and directory
TARGET	= $$qtLibraryTarget(cornea_tracing_plugin)
DESTDIR	= $$VAA3DPATH/bin/plugins/cornea_tracing_plugin/
