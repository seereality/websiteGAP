//doxygen
/*! \file */

#include "VisageFeaturesDetector.h"
#include "visageVision.h"
#include "Common.h"

#define MAX_IMAGE_SIZE 1000.0f

using namespace std;
using namespace VisageSDK;

/**
 * VisageFeaturesDetector instance.
 */
VisageFeaturesDetector* m_Detector;

/**
*	Performs facial features detection on a file.

	Perform facial feature detection on the image given by fileName. If successful, return the image with the feature points drawn on top of it. Also, an FDP object is created and saved in the current working directory.
	Otherwise, return NULL.
	
	@param fileName The name of the image file to process.
	@return annotated image file if successful, NULL if not.
*
*/
IplImage* DetectFeatures(char *fileName)
{
	int value;
	FDP* f = new FDP();

	// Load the image
	IplImage* frame = 0;
	IplImage* frame_resized = 0;
	frame = cvLoadImage(fileName);

	if(!frame) return NULL;

	//resize the image if image is too big
	if( frame->height > MAX_IMAGE_SIZE || frame->width > MAX_IMAGE_SIZE )
	{
		float step = 1.0f;
		if( frame->height >= frame->width )
			step = MAX_IMAGE_SIZE/static_cast<float>(frame->height);
		else
			step = MAX_IMAGE_SIZE/static_cast<float>(frame->width);
		int w = static_cast<int>(static_cast<float>(frame->width)*step);
		int h = static_cast<int>(static_cast<float>(frame->height)*step);
		frame_resized = cvCreateImage(cvSize(w, h), frame->depth, frame->nChannels);
		cvResize(frame, frame_resized);
		cvReleaseImage(&frame);
	}
	else frame_resized = frame;
		

	//MORE THAN 1 FACE
	int maxFaces = 100;
	FaceData* data = new FaceData[maxFaces];

	value = m_Detector->detectFacialFeatures(frame_resized, data, maxFaces); 

	if(value > 0)
	{
		// save feature points into file
		for(int i = 0; i < value; i++)
		{
			char tmpFileName[200];
			strcpy(tmpFileName,fileName);
			if(strlen(tmpFileName)>4)
			{
				tmpFileName[strlen(tmpFileName)-4] = 0;

				char idx[10];
				sprintf(idx, "%d", i);
				strcat(tmpFileName, "_");
				strcat(tmpFileName, idx);
				strcat(tmpFileName,".fdp");
				//data[i].featurePoints2D->saveToFile(); //UN-COMMENT THIS LINE IN ORDER TO WRITE THE FDP FILE
			}
		}
		
		m_Detector->drawResults(frame_resized);
	}

	delete[] data;

	return frame_resized;
}

void help(){
	const char help[500] = \
	"Usage:\n" \
	"./FaceDetector imageName.jpg\n" \
	"*Working directory is being set to Samples/Linux/data folder*";
	printf("%s\n",help);
}

namespace VisageSDK //all visage|SDK calls must be in visageSDK namespace
{
	void initializeLicenseManager(char *licenseKeyFileFolder);
}
/*! \mainpage  visage|SDK VisageDetectorDemo example project
*
* \htmlonly
* <table border="0">
* <tr>
* <td width="32"><a href="../../../../../bin/VisageDetectorDemo"><img src="../../../../../doc/images/run_sample.png" border=0 title="Run Sample (this may not work in all browsers, in such case please run VisageDetectorDemo from the visageSDK\bin folder.)"></a></td>
* <td width="32"><a href="../../../../../bin"><img src="../../../../../doc/images/open_bin_folder.png" border=0 title="Open Executable Folder (visageSDK\bin)"></a></td>
* <td width="32"><a href="../../../data/images"><img src="../../../../../doc/images/open_data_folder.png" border=0 title="Open Data Folder"></a></td>
* <td width="32"><a href="../../../build"><img src="../../../../../doc/images/open_project_folder.png" border=0 title="Open Project Folder"></a></td>
* <td width="32"><a href="../../../source/VisageDetectorDemo"><img src="../../../../../doc/images/open_source_folder.png" border=0 title="Open Source Code Folder"></a></td>
* </tr>
* </table>
* \endhtmlonly
*
*  \htmlonly
* <h2>Dependencies</h2>
*
* Prerequisites to building and running the sample project are:
* <ul>
* <li>g++ compiler (versions 4.6.x) (sudo apt-get install g++)</li>
* <li>OpenGL with dynamic libraries: GL, GLU (sudo apt-get install freeglut3-dev)</li>
* <li>jpeg and pthread dynamic libraries (sudo apt-get install libjpeg62-dev)</li>
* <li>FFMPEG with dynamic libraries: swscale, avformat (sudo apt-get install ffmpeg libswscale-dev libavformat-dev)</li>
* <li>GTK+ 2.0 with dynamic library: gtk-x11-2.0 (sudo apt-get install libgtk2.0-dev)</li>
* </ul>
* </p>
* \endhtmlonly
*
*  \htmlonly
* <h2>Running prebuilt sample</h2>
* \endhtmlonly
*
* The VisageDetectorDemo example project demonstrates the following capabilities of visage|SDK:
*
* - facial features detection in still images
*
*
* To use the application: 
*
* Run the './VisageDetectorDemo <filename>' command from the terminal\n\n
* This will perform facial features detection on a provided image (<filename>). If no image is provided detection will be performed on a default image. The sample is 
* modified to run from the visageSDK/bin folder. It changes the current directory to ../Samples/Linux/data folder where Face Detector.cfg configuration file is located. 
* Images are provided relative to that folder. The image should represent a face, in frontal pose and with a neutral expression. The face should not take a too big portion of the image,
*	  i.e., less than 50%. Several test images are available in the folder <a href="../../../data/images">Samples/Linux/data/images</a>.
*
* The specific classes and methods that demonstrate visage|SDK are:
* - main(): Initialises the Facial Feature Detector @ref m_Detector.
* - IplImage* DetectFeatures(char *fileName): Performs facial features detection on a still image and displays the result
*
* \htmlonly
* <h2>Building the project</h2>
*
* <p>
* The VisageTrackerDemo sample project source file is located in the <a href="../../../source/VisageDetectorDemo">Samples/Linux/source/VisageDetectorDemo</a> subfolder of the visage|SDK for Linux folder.
* It is built using the provided Makefile located in Samples/Linux/build subfolder.
* </p>
* \endhtmlonly
*/
int main( int argc, const char* argv[] ){
	
	initializeLicenseManager("786-494-573-353-029-991-393-591-422-193-395.vlc");
	
	m_Detector = new VisageFeaturesDetector();

	//Set current directory to data directory because Face Detector.cfg is located there
	if (chdir("../Samples/Linux/data")!=0){
		printf("Unable to change current directory.");
		help();
		return -1;
	}
		
	
	std::string dataPath("bdtsdata");
	
	char imageName[200] = "images/faces1.jpg";
	
	if (argc == 1) {
		help();
		printf("Default image will be used - faces1.jpg\n");
	}
	else if (argc >=2) {
		printf("Detecting faces on %s ...\n",argv[1]);
		strcpy(imageName,argv[1]);
	}

	if (!m_Detector->Initialize(dataPath.c_str()))		{
		printf("Could not load required data files.\n");
	}
	else{
		IplImage* detected = DetectFeatures(imageName);
		cvNamedWindow("FaceDetector");
		cvShowImage("FaceDetector", detected);
		cvWaitKey(0);
		cvDestroyWindow("FaceDetector");
	}
	
	return 0;
}