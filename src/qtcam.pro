# Add more folders to ship with the application, here
folder_01.source = qml/qtcam
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

QT += widgets
TARGET = qtcam

CONFIG += c++11

#generating embedded resourses for all those files (former deployment)
win32: PERL=perl.exe
else:  PERL=perl
system(cd $$PWD; $$PERL makeqrc.pl > qmls.qrc)
RESOURCES += qmls.qrc


#CONFIG += release

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    logger.cpp \
    about.cpp \
    cameraproperty.cpp \
    videostreaming.cpp \
    uvccamera.cpp \
    v4l2-api.cpp \
    seecam_10cug_m.cpp \
    seecam_10cug_bayer.cpp \
    seecam_11cug.cpp \
    seecam_cu80.cpp \
    seecam_cu50.cpp \
    seecam_ar0130.cpp \
    videoencoder.cpp \
    seecam_cu51.cpp \
    see3cam_cu130.cpp \
    h264decoder.cpp \
    ascella.cpp

# Installation path
# target.path =
target.path = /usr/bin/

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)

#do not need deployment since it is already inside binary
#qtcAddDeployment()

CONFIG(debug):
{
  message( "Building the DEBUG Version" )
  DEFINES += _DEBUG
}

HEADERS += \
    logger.h \
    about.h \
    cameraproperty.h \
    videostreaming.h \
    uvccamera.h \
    v4l2-api.h \
    seecam_10cug_m.h \
    seecam_10cug_bayer.h \
    seecam_11cug.h \
    seecam_cu80.h \
    seecam_cu50.h \
    seecam_ar0130.h \
    videoencoder.h \
    seecam_cu51.h \
    see3cam_cu130.h \
    h264decoder.h \
    ascella.h \
    incl_libs.h

INCLUDEPATH +=  $$PWD/v4l2headers/include


LIBS += -lv4l2 -lv4lconvert \
        -lavutil \
        -lavcodec \
        -lavformat \
        -lswscale \
        -ludev \
        -lusb-1.0 \
        -lturbojpeg


QMAKE_CFLAGS_THREAD = -D__STDC_CONSTANT_MACROS      #For Ubuntu 12.04 compilation
QMAKE_CXXFLAGS_THREAD = -D__STDC_CONSTANT_MACROS    #For Ubuntu 12.04 compilation

OTHER_FILES += \
    qml/qtcam/videocapturefilter_QML/videocapturefilter_qml.qml

