CC=g++

IGNORE = -Wno-comment

CCFLAGS = -O2 -Wall -D"NDEBUG" -D"VISAGE_STATIC" -D"LINUX" 

#************************************
#***** PATH TO HEADERS AND LIBS *****
#************************************
VISAGE_DEPENDENCIES = ../../../dependencies
VISAGE_HEADERS  = ../../../include
VISAGE_SOURCE  = ../../../source

OPENCV_LIB_PATH = $(VISAGE_DEPENDENCIES)/OpenCV-Linux/lib
#LICENSE_LIB_PATH = ../libLicense
VISION_LIB_PATH = ../../../lib

#************************************
#***** LIB FOLDERS TO SEARCH ********
#************************************
LOCAL_LIB_PATHS = \
	-L$(OPENCV_LIB_PATH) \
	-L$(VISION_LIB_PATH)
#	-L$(LICENSE_LIB_PATH) \

#************************************
#***** LIB FILES ADDED  *************
#************************************
LOCAL_LIB_FILES = \
	-lVision \
	-lpthread \
	-lGL \
	-lGLU \
	-lOpenCV \
	-ljpeg \
	-lswscale \
	-lavformat \
	-lcurses \
	-lgtk-x11-2.0

#************************************
#***** H FILES INLCUDED  ************
#************************************
LOCAL_C_INCLUDES =  \
    -I$(VISAGE_HEADERS) \
    -I$(VISAGE_DEPENDENCIES)/OpenCV-Linux/include \
    -I$(VISAGE_DEPENDENCIES)/OpenCV-Linux/include/opencv

TRACKER_OUT = SimpleTracker
DETECTOR_OUT = SimpleDetector
#************************************
#***** CPP FILES BUILT  *************
#************************************
SIMPLETRACKER_SOURCE_PATH = ../source/VisageTrackerDemo
SIMPLEDETECTOR_SOURCE_PATH = ../source/VisageDetectorDemo
	
TRACKER_SRC_FILES = $(SIMPLETRACKER_SOURCE_PATH)/SimpleTracker.cpp
DETECTOR_SRC_FILES = $(SIMPLEDETECTOR_SOURCE_PATH)/SimpleDetector.cpp

default: buildTracker buildDetector

buildTracker: 
	$(CC) $(CCFLAGS) $(IGNORE) $(LOCAL_LIB_PATHS) $(LOCAL_C_INCLUDES) $(TRACKER_SRC_FILES) $(LOCAL_LIB_FILES) -o ../../../bin/VisageTrackerDemo

buildDetector:
	$(CC) $(CCFLAGS) $(IGNORE) $(LOCAL_LIB_PATHS) $(LOCAL_C_INCLUDES) $(DETECTOR_SRC_FILES) $(LOCAL_LIB_FILES) -o ../../../bin/VisageDetectorDemo
	
