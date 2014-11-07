//doxygen
/*! \file */

#include <stdio.h>
#include "visageVision.h"
#include "StrStreamUtils.h"
#include "term.h"

using namespace std;
using namespace VisageSDK;

VisageTracker2 *m_Tracker = 0;

/**
 * 
 */
void my_fflush(void)
{
    int c;
    do {
        c = getchar();
    } while (c != '\n' && c != EOF);
}

/**
* Function for clearing console window. 
*/
void my_ClrScrn(void)
{
  if (!cur_term)
    {
    int result;
    setupterm( NULL, STDOUT_FILENO, &result );
    if (result <= 0) return;
    }

  putp( tigetstr( "clear" ) );
}
/**
 * Helper function, performs matrix mutliplication
 */
void multiplyMatrix(float* m1, float* m2, float* res, int M, int N, int P)
{
	for (int i = 0; i < M; ++i)
	{
		for (int j = 0; j < P; ++j)
		{
			float sum = 0;
			for (int k = 0; k < N; ++k)
			{
				sum += m1[i*N+k] * m2[k*P+j];
			}
			res[i*P+j] = sum;
		}
	}
}

/**
 * Performs gaze points projection, translation and rotation. Finally, draws gaze.
 */
void drawGaze(IplImage* img, FaceData* td, int r, int g, int b)
{
	int f = 3;
	int x_offset = 1;
	int y_offset = 1;
	
	int m_width = td->frame->width;
	int m_height = td->frame->height;

	if (m_width >= m_height)
		x_offset = m_width  / m_height;
	else
		y_offset = m_height / m_width ;

	float frustum_near = 0.001f;
	int frustum_far = 30;
	float frustum_x = x_offset*frustum_near/f;
	float frustum_y = y_offset*frustum_near/f;

	float A = (frustum_x - frustum_x)/(frustum_x + frustum_x);
	float B = (frustum_y - frustum_y)/(frustum_y + frustum_y);
	float C = - ((frustum_far + frustum_near)/(frustum_far - frustum_near));
	float D = - ((2*frustum_near*frustum_far)/(frustum_far-frustum_near));
	float x1 = (2*frustum_near)/(frustum_x+frustum_x);
	float y2 = (2*frustum_near)/(frustum_y+frustum_y);
	float frustumMatrix[16] = {x1,0,A,0,0,y2,B,0,0,0,C,D,0,0,-1,0};

	float dest[] = {0,0,0.05};

	float sinrx = sinf(td->gazeDirectionGlobal[0]);
	float sinry = sinf(td->gazeDirectionGlobal[1]);
	float sinrz = sinf(td->gazeDirectionGlobal[2]);
	float cosrx = cosf(td->gazeDirectionGlobal[0]);
	float cosry = cosf(td->gazeDirectionGlobal[1]);
	float cosrz = cosf(td->gazeDirectionGlobal[2]);

	//set the rotation matrix
	float R00 = cosry*cosrz+sinrx*sinry*sinrz;
	float R01 = -cosry*sinrz+sinrx*sinry*cosrz;
	float R02 = cosrx*sinry;
	float R10 = cosrx*sinrz;
	float R11 = cosrx*cosrz;
	float R12 = -sinrx;
	float R20 = -sinry*cosrz+sinrx*cosry*sinrz;
	float R21 = sinry*sinrz+sinrx*cosry*cosrz;
	float R22 = cosrx*cosry;

	//apply rotation
	float dest_new[] = {0,0,0};
	dest_new[0] = 1*(R00*dest[0]+R01*dest[1]+R02*dest[2]);
	dest_new[1] = 1*(R10*dest[0]+R11*dest[1]+R12*dest[2]);
	dest_new[2] = 1*(R20*dest[0]+R21*dest[1]+R22*dest[2]);

	dest[0] = dest_new[0];
	dest[1] = dest_new[1];
	dest[2] = dest_new[2];

	float destPom[4] = {dest[0],dest[1],dest[2],1};
	float result[4];
	multiplyMatrix(destPom,frustumMatrix,result,1,4,4);

	dest[0] /= dest[2]*3;
	dest[1] /= dest[2]*3;
	dest[2] /= dest[2]*3;

	dest[0] = result[0];
	dest[1] = result[1];
	dest[2] = result[2];


	FDP* featurePoints2D = td->featurePoints2D;
	FeaturePoint* le = const_cast<FeaturePoint*>( &featurePoints2D->getFP(3,5));
	FeaturePoint* re = const_cast<FeaturePoint*>( &featurePoints2D->getFP(3,6));
	
	CvScalar color = cvScalar(b, g, r);
	
	if (le->defined && td->eyeClosure[0])
	{
		//apply translation left eye
		float left_gaze_x = dest[0] + le->pos[0];
		float left_gaze_y = dest[1] + le->pos[1];
		
		//draw left eye gaze
		cvLine(img, cvPoint(le->pos[0]*m_width, (1-le->pos[1])*m_height), cvPoint(left_gaze_x*m_width, (1-left_gaze_y)*m_height), color, 2);
	}
	if (re->defined && td->eyeClosure[1])
	{		
		//apply translation right eye
		float right_gaze_x = dest[0] + re->pos[0];
		float right_gaze_y = dest[1] + re->pos[1];
		
		//draw righ eye gaze
		cvLine(img, cvPoint(re->pos[0]*m_width, (1-re->pos[1])*m_height), cvPoint(right_gaze_x*m_width, (1-right_gaze_y)*m_height), color, 2);
	}
}

/**
 * Draw line of color (r,g,b) on img with given defined points representing FDP points.
 */ 
void drawLines(IplImage* img, int* points, FDP* fdp, int num, int r, int g, int b)
{
	float* vertices = new float[2 * num];
	int faces = 1;
		
	for(int i = 0; i < faces; i++)
	{
		FeaturePoint* fp;
		int n = 0;
		for(int j = 0; j < num; j++)
		{
			fp = const_cast<FeaturePoint*>(&fdp->getFP(points[2 * j], points[2 * j + 1]));
			if(fp->defined)
			{
				if(fp->pos[0] != 0 && fp->pos[1] != 0)
				{
					vertices[2 * n + 0] = fp->pos[0] * img->width;
					vertices[2 * n + 1] = (1-fp->pos[1]) * img->height;
					n++;
				}
			}
		}

		CvScalar color = cvScalar(b, g, r);

		for(int j = 0; j < n ; j+=2)
		{
			cvLine(img, cvPoint(vertices[2 * j + 0], vertices[2 * j + 1]), cvPoint(vertices[2 * (j + 1) + 0], vertices[2 * (j + 1) + 1]), color, 1);
		}
	}

	delete[] vertices;
}

/**
 * Draw lineloop of color (r,g,b) on img with given defined points representing FDP points.
 */ 
void drawLineLoop(IplImage* img, int* points, FDP* fdp, int num, int r, int g, int b)
{
	float* vertices = new float[2 * num];
	int faces = 1;
	
	for(int i = 0; i < faces; i++)
	{
		FeaturePoint* fp;
		int n = 0;
		for(int j = 0; j < num; j++)
		{
			fp = const_cast<FeaturePoint*>(&fdp->getFP(points[2 * j], points[2 * j + 1]));
			if(fp->defined)
			{
				if(fp->pos[0] != 0 && fp->pos[1] != 0)
				{
					vertices[2 * n + 0] = fp->pos[0] * img->width;
					vertices[2 * n + 1] = (1-fp->pos[1]) * img->height;
					n++;
				}
			}
		}

		CvScalar color = cvScalar(b, g, r);

		for(int j = 0; j < n - 1; j++)
		{
			cvLine(img, cvPoint(vertices[2 * j + 0], vertices[2 * j + 1]), cvPoint(vertices[2 * (j + 1) + 0], vertices[2 * (j + 1) + 1]), color, 1);
		}

		cvLine(img, cvPoint(vertices[2 * (num - 1) + 0], vertices[2 *(num - 1) + 1]), cvPoint(vertices[2 * 0 + 0], vertices[2 * 0 + 1]), color, 1);
	}

	delete[] vertices;
}

/**
 * Draw points of color (r,g,b) on img with given defined points representing FDP points.
 */ 
void drawPoints2D(IplImage* img, int* points, FDP* fdp, int num, int r, int g, int b)
{
	int faces = 1;

	CvScalar color = cvScalar(b, g, r);

	for(int j = 0; j < faces; j++)
	{
		FeaturePoint* fp;
		for (int i = 0; i < num; i++) 
		{
			fp = const_cast<FeaturePoint*>( &fdp->getFP(points[2*i],points[2*i+1]) );
			if(fp->defined)
			{
				if(fp->pos[0]!=0 && fp->pos[1]!=0)
				{
					float x = fp->pos[0] * img->width;
					float y = (1-fp->pos[1]) * img->height;

					cvCircle(img, cvPoint(x, y), 2, color, -1);
				}
			}
		}
	}
	
}

/**
 * Draw facial features
 */
void drawResults(IplImage* img, FDP* featurePoints2D, float* eyeClosure)
{
	if(!featurePoints2D)
	{
		return;
	}

	int GrSize[12] = {0,0,14,14,6,4,4,1,10,15,10,5};

	static int chinPoints[] = {
		2,	14,
		2,	12,
		2,	1,
		2,	11,
		2,	13,
		2,	10,
	};
	static int chinLinesPoints[] = {
		2,	14,
		2,	12,
		2,	12,
		2,	1,
		2,	1,
		2,	11,
		2,	11,
		2,	13,
		2,	1,
		2,	10,
	};

	drawPoints2D(img, chinPoints, featurePoints2D, 6, 128, 128, 255);
	drawLines(img, chinLinesPoints, featurePoints2D, 10, 128, 128, 255);

	static int innerLipPoints[] = {
			2,	2,
			2,	6,
			2,	4,
			2,	8,
			2,	3,
			2,	9,
			2,	5,
			2,	7,
		};

	drawPoints2D(img, innerLipPoints, featurePoints2D, 8, 236, 0, 0);
	drawLineLoop(img, innerLipPoints, featurePoints2D, 8, 236, 0, 0);

	static int outerLipPoints[] = {
			8,	1,
			8,	10,
			8,	5,
			8,	3,
			8,	7,
			8,	2,
			8,	8,
			8,	4,
			8,	6,
			8,	9,
		};

	drawPoints2D(img, outerLipPoints, featurePoints2D, 10, 236, 0, 0);
	drawLineLoop(img, outerLipPoints, featurePoints2D, 10, 236, 0, 0);

		static int nosePoints[] = {
			9,	1,
			9,	2,
			9,	3,
			9,	4,
			9,	5,
			9,	6,
			9,	7,
			9,	8,
			9,	9,
			9,	10,
			9,	11,
			9,	12,
			9,	13,
			9,	14,
			9,	15,
		};
		static int noseLinesPoints1[] = {
			9,	15,		//part one
			9,	4,
			9,	2,
			9,	3,
			9,	1,
			9,	5,
		};
		static int noseLinesPoints2[] = {
			9,	6,		//part two
			9,	7,
			9,	13,
			9,	12,
			9,	14,
		};
		static int noseLinesPoints3[] = {
			9,	14,		//part three
			9,	2,
			9,	13,
			9,	1,
		};

		drawPoints2D(img, nosePoints, featurePoints2D, 15, 100, 100, 100);
		drawLineLoop(img, noseLinesPoints1, featurePoints2D, 6, 100, 100, 100);
		drawLineLoop(img, noseLinesPoints2, featurePoints2D, 5, 100, 100, 100);
		drawLines(img, noseLinesPoints3, featurePoints2D, 4, 100, 100, 100);

		if (eyeClosure[0]==1){
			static int irisPoints[] = {
				3,	5
			};
			drawPoints2D(img, irisPoints, featurePoints2D, 1, 255,255,0);
		}
		if (eyeClosure[1]==1){
			static int irisPoints[] = {
				3,	6
			};
			drawPoints2D(img, irisPoints, featurePoints2D, 1, 255,255,0);
		}
		static int eyesLinesPoints1[] = {
			3,	12,
			3,	14,
			3,	8,
			3,	10,
		};
		static int eyesLinesPoints2[] = {
			3,	12,
			3,	2,
			3,	8,
			3,	4,
		};
		static int eyesLinesPoints3[] = {
			3,	11,
			3,	13,
			3,	7,
			3,	9,
		};
		static int eyesLinesPoints4[] = {
			3,	11,
			3,	1,
			3,	7,
			3,	3,
		};

		static int eyesPoints[] = {
			3,	2,
			3,	4,
			3,	8,
			3,	10,
			3,	12,
			3,	14,
		};
		static int eyesPoints2[] = {
			3,	1,
			3,	3,
			3,	7,
			3,	9,
			3,	11,
			3,	13,
		};
		if (eyeClosure[1]==1){
			drawPoints2D(img, eyesPoints, featurePoints2D, 6, 255, 143, 32);
			drawLineLoop(img, eyesLinesPoints1, featurePoints2D, 4, 255, 143, 32);
			drawLineLoop(img, eyesLinesPoints2, featurePoints2D, 4, 255, 143, 32);
		}
		else if (eyeClosure[1]==0){
			drawPoints2D(img, eyesPoints, featurePoints2D, 6, 255,0,0);
			drawLineLoop(img, eyesLinesPoints1, featurePoints2D, 4, 255,0,0);
			drawLineLoop(img, eyesLinesPoints2, featurePoints2D, 4, 255,0,0);
		}
		if (eyeClosure[0]==1){
			drawPoints2D(img, eyesPoints2, featurePoints2D, 6, 255, 143, 32);
			drawLineLoop(img, eyesLinesPoints3, featurePoints2D, 4, 255, 143, 32);
			drawLineLoop(img, eyesLinesPoints4, featurePoints2D, 4, 255, 143, 32);
		}
		else if (eyeClosure[0]==0){
			drawPoints2D(img, eyesPoints2, featurePoints2D, 6, 255,0,0);
			drawLineLoop(img, eyesLinesPoints3, featurePoints2D, 4, 255,0,0);
			drawLineLoop(img, eyesLinesPoints4, featurePoints2D, 4, 255,0,0);
		}
		

		static int cheekPoints[] = {
			5,	1,
			5,	2,
			5,	3,
			5,	4,
		};

		drawPoints2D(img, cheekPoints, featurePoints2D, 4, 100, 100, 100);


		static int earPoints[] = {
			10,	1,
			10,	2,
			10,	3,
			10,	4,
			10,	5,
			10,	6,
			10,	7,
			10,	8,
			10,	9,
			10,	10,
		};

		drawPoints2D(img, earPoints, featurePoints2D, 10, 100, 100, 100);

		static int earcheekLinesPoints1[] = {
			5,	2,
			5,	4,
			10,	10,
			10,	8,
		};
		static int earcheekLinesPoints2[] = {
			5,	1,
			5,	3,
			10,	9,
			10,	7,
		};
	
		drawLineLoop(img, earcheekLinesPoints1, featurePoints2D, 4, 100, 100, 100);
		drawLineLoop(img, earcheekLinesPoints2, featurePoints2D, 4, 100, 100, 100);

		static int eyebrowPoints[] = {
			4,	1,
			4,	2,
			4,	3,
			4,	4,
			4,	5,
			4,	6,
		};
		static int eyebrowLinesPoints[] = {
			4,	6,
			4,	4,
			4,	4,
			4,	2,
			4,	1,
			4,	3,
			4,	3,
			4,	5,
		};

		drawPoints2D(img, eyebrowPoints, featurePoints2D, 6, 227, 254, 73);
		drawLines(img, eyebrowLinesPoints, featurePoints2D, 8, 227, 254, 73);

		static int hairPoints[] = {
			11,	1,
			11,	2,
			11,	3,
			11,	4,
			11,	5,
			11,	6,
		};
		static int hairLinesPoints[] = {
			11,	2,
			11,	1,
			11,	1,
			11,	3,
		};

		drawPoints2D(img, hairPoints, featurePoints2D, 6, 100, 100, 100);
		drawLines(img, hairLinesPoints, featurePoints2D, 4, 100, 100, 100);
}
 
/**
* The simple observer class for displaying notifications from tracker
*
*/
class SimpleObserver : public VisageTrackerObserver {
public:
	/**
	 * Implementation of virtual function from VisageTrackerObserver interface.
	 * See @ref VisageTrackerObserver::Notify().
	 */
	void Notify(VisageTracker2 *tracker, long timeStamp)
	{
		my_ClrScrn();
		printf("Tracking in progress!\n\n");

		FaceData trackingData;

		int track_stat = tracker->getTrackingData(&trackingData);

		bool display_status = trackingData.initDisplayStatus;
		bool face_detected = trackingData.initFaceDetected;
		float yaw = trackingData.initYaw;
		float roll = trackingData.initRoll;
		float velocity = trackingData.initVelocity;
		float tracking_quality = trackingData.trackingQuality;

		char *tstatus;
		switch (track_stat) {
			case TRACK_STAT_OFF:
				tstatus = "OFF";
				break;
			case TRACK_STAT_OK:
				tstatus = "OK";
				break;
			case TRACK_STAT_RECOVERING:
				tstatus = "RECOVERING";
				break;
			case TRACK_STAT_INIT:
				tstatus = "INITIALIZING";
				break;
			default:
				tstatus = "N/A";
				break;
		}

		printf(" Tracking status: %s\n\n", tstatus);

		static float eyeDistance = -1.0f;

		// Example code for accessing specific feature points, in this case nose tip and eyes
		if(track_stat == TRACK_STAT_OK)
		{
			FDP *fp = trackingData.featurePoints3DRelative;
			float nosex = fp->getFPPos(9,3)[0];
			float nosey = fp->getFPPos(9,3)[1];
			float nosez = fp->getFPPos(9,3)[2];
			float lex = fp->getFPPos(3,5)[0];
			float ley = fp->getFPPos(3,5)[1];
			float lez = fp->getFPPos(3,5)[2];
			float rex = fp->getFPPos(3,6)[0];
			float rey = fp->getFPPos(3,6)[1];
			float rez = fp->getFPPos(3,6)[2];
			float eyedist = lex -rex;
			int dummy = 0;
		}

		// display the frame rate, position and other info
		float trackingFrameRate = trackingData.frameRate;
		int ix,iy,wx,wy,dx,dy;
		tracker->getResolution(ix,iy,wx,wy,dx,dy); //deprecated
		float r1[3];
		float t1[3];
		if(track_stat == TRACK_STAT_OK)
		{
			for(int i=0;i<3;i++)
				r1[i] = (180.0f * trackingData.faceRotation[i]) / 3.14f;
			for(int i=0;i<3;i++)
				t1[i] = trackingData.faceTranslation[i] * 100.0f; //translation is expressed in meters so this gives approximate values in centimeters if camera focus distance parameter f in fbft is set correctly
		}
		else
		{
			for(int i=0;i<3;i++)
				r1[i] = 0.0f;
			for(int i=0;i<3;i++)
				t1[i] = 0.0f; 
		}
		printf(" %4.1f FPS \n Head position %+5.1f %+5.1f %+5.1f \n Rotation (deg) %+5.1f %+5.1f %+5.1f \n Resolution: input %dx%d  work %dx%d \n\n",trackingFrameRate,t1[0],t1[1],t1[2],r1[0],r1[1],r1[2],ix,iy,wx,wy);
		
		if(track_stat == TRACK_STAT_OK)
		{
			FDP *fp = trackingData.featurePoints2D;
			drawResults(trackingData.frame,fp, trackingData.eyeClosure);
			drawGaze(trackingData.frame,&trackingData,0,255,0);
		}
		//tracker->drawResults();
		cvShowImage("SimpleTracker",trackingData.frame);
		cvWaitKey(1);
	}
};

/**
* The main function for tracking from a video file. 
* It is called when the 'v' is chosen.
*
*/
void trackfromavivideo(char *strAviFile, char *cfgFile)
{
	if(m_Tracker->isActive())
	{
		m_Tracker->stop();
	}

	//set the resulting .fba file name to the original .avi file name (just change the extension to .fba)
	string fbaFileName = strAviFile;
	fbaFileName.erase(fbaFileName.find_last_of(".")+1);
	fbaFileName.append("fba");

	// set the configuration file
	m_Tracker->setTrackerConfigurationFile(cfgFile);

	m_Tracker->trackFromAvi(strAviFile, NULL);
}

/**
* The main function for tracking from a video camera connected to the computer.
* It is called when the 'c' is chosen.
*
*/
void trackfromcam(char *cfgFile)
{
	if(m_Tracker->isActive())
	{
		m_Tracker->stop();
	}

	// set the configuration file
	m_Tracker->setTrackerConfigurationFile(cfgFile);

	m_Tracker->trackFromCam(NULL);
}

namespace VisageSDK //all visage|SDK calls must be in visageSDK namespace
{
	void initializeLicenseManager(char *licenseKeyFileFolder);
}

/*! \mainpage  visage|SDK VisageTrackerDemo example project
*
* \htmlonly
* <table border="0">
* <tr>
* <td width="32"><a href="../../../../../bin/VisageTrackerDemo"><img src="../../../../../doc/images/run_sample.png" border=0 title="Run Sample (this may not work in all browsers, in such case please run VisageTrackerDemo from the visageSDK\bin folder.)"></a></td>
* <td width="32"><a href="../../../../../bin"><img src="../../../../../doc/images/open_bin_folder.png" border=0 title="Open Executable Folder (visageSDK\bin)"></a></td>
* <td width="32"><a href="../../../data"><img src="../../../../../doc/images/open_data_folder.png" border=0 title="Open Data Folder"></a></td>
* <td width="32"><a href="../../../data/video"><img src="../../../../../doc/images/open_folder.png" border=0 title="Open Video Folder"></a></td>
* <td width="32"><a href="../../../build"><img src="../../../../../doc/images/open_project_folder.png" border=0 title="Open Project Folder"></a></td>
* <td width="32"><a href="../../../source/VisageTrackerDemo"><img src="../../../../../doc/images/open_source_folder.png" border=0 title="Open Source Code Folder"></a></td>
* </tr>
* </table>
* \endhtmlonly
*
* \htmlonly
* <h2>Dependencies</h2>
*
* Prerequisites to building the sample project are:
* <ul>
* <li>g++ compiler (versions 4.6.x) (sudo apt-get install g++)</li>
* <li>OpenGL with dynamic libraries: GL, GLU (sudo apt-get install freeglut3-dev)</li>
* <li>jpeg and pthread dynamic libraries (sudo apt-get install libjpeg62-dev)</li>
* <li>FFMPEG with dynamic libraries: swscale, avformat (sudo apt-get install ffmpeg libswscale-dev libavformat-dev)</li>
* <li>GTK+ 2.0 with dynamic library: gtk-x11-2.0 (sudo apt-get install libgtk2.0-dev)</li>
* <li>curses terminal control library (sudo apt-get install libncurses5-dev)</li>
* </ul>
* </p>
* \endhtmlonly
*
* \htmlonly
* <h2>Running prebuilt sample</h2>
* \endhtmlonly
*
* The VisageTrackerDemo example project demonstrates the following capabilities of visage|SDK:
* - real-time head/facial features tracking from video file or camera, with on-the-fly animation, based on the VisageSDK::VisageTracker2 tracker
*
* To use the application: 
*
* Run the './VisageTrackerDemo' command from the terminal\n\n
* This is an intentionally simpliefied version of a tracking application, intended to be used by developers as 
* an introduction. VisageTrackerDemo is a console application, with keyboard based choices made by the
* user. It then starts tracking and displays tracking status and numeric results in the console. Results are also visualized in an additional window as an overlay 
* over the original image.
*
* Classes and methods that are important for detailed understanding how this
* sample project is implemented and how it used visage|SDK are:
* - main(): implements the main user interaction.
* - SimpleObserver::Notify(): Called by VisageSDK::VisageTracker2 once for each video frame; it receives and prints the tracking status and tracking results.
* 
* \htmlonly
* <h2>Building the project</h2>
*
* <p>
* The VisageTrackerDemo sample project source file is located in the <a href="../../../source/VisageTrackerDemo">Samples/Linux/source/VisageTrackerDemo</a> subfolder subfolder of the visage|SDK for Linux folder.
* It is built using the provided Makefile located in Samples/Linux/build subfolder.
* </p>
* \endhtmlonly
*/

/**
* The simple tracker.
*
*/
int main( int argc, const char* argv[] )
{
	char *videofilename = "../Samples/Linux/data/video/capture1.avi";
	char *cfgfile = NULL;
	char source, type;

	SimpleObserver *observer = new SimpleObserver();

	char defaultConfigFile[100];
	
	FILE *f = fopen("../Samples/Linux/data/DefaultConfiguration.txt","r");
	if (f == NULL) {
		printf("Error opening default configuration file!\n");
		exit(1);
	}
	
	fgets(defaultConfigFile,100,f);
	fclose(f);

	defaultConfigFile[strlen(defaultConfigFile)-2] = 0; //remove line feed character
	
	initializeLicenseManager("786-494-573-353-029-991-393-591-422-193-395.vlc");

	m_Tracker = new VisageTracker2(NULL,NULL,defaultConfigFile); 
	m_Tracker->attach(observer);

	printf("Simple Tracker application\n\n");

	printf("Track from (v)ideo or (c)am? ");
	scanf("%c", &source); my_fflush();

	printf("Type of tracking (h)ead, (f)acial features or (d)efault? ");
	scanf("%c", &type); my_fflush();

	switch (type) {
		case 'h':
			cfgfile = "../Samples/Linux/data/Head Tracker.cfg";
			break;
		case 'f':
			cfgfile = "../Samples/Linux/data/Facial Features Tracker - Asymmetric.cfg";
			break;
		default:
			cfgfile = defaultConfigFile;
			break;
	}

	switch (source) {
		case 'v':
			trackfromavivideo(videofilename, cfgfile);
			break;
		case 'c':
			trackfromcam(cfgfile);
			break;
		default:
			printf("Wrong choice!\n");
			break;
	}
	
	cvNamedWindow("SimpleTracker",CV_WINDOW_AUTOSIZE);
	cvMoveWindow("SimpleTracker",100,100);
	// Waiting while tracker is tracking
	while (m_Tracker->isActive()) {
#ifdef LINUX
		sleep(5000);
#else
		Sleep(5000);
#endif
	}

	m_Tracker->stop();

	delete m_Tracker;
	delete observer;

	return 0;
}
