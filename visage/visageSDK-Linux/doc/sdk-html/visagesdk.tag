<?xml version='1.0' encoding='ISO-8859-1' standalone='yes' ?>
<tagfile>
  <compound kind="class">
    <name>VisageSDK::VisageTracker2</name>
    <filename>classVisageSDK_1_1VisageTracker2.html</filename>
    <member kind="function">
      <type></type>
      <name>VisageTracker2</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>aebe7637e883200e58ea217f7c26e3731</anchor>
      <arglist>(const char *trackerConfigFile)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>VisageTracker2</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>aa1746f1da3f8afded750ff404c495d5d</anchor>
      <arglist>(TrackerOpenGLInterface *oglInterface, TrackerGUIInterface *guiInterface, const char *trackerConfigFile)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~VisageTracker2</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a27561595aef5a95c8852ef42b9288263</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>trackFromCam</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>aef0051e31528af4d11352a6582e16031</anchor>
      <arglist>(const char *outFbaFileName=NULL, int orientation=VISAGE_CAMERA_UP, int frameGrabberImageFormat=VISAGE_FRAMEGRABBER_FMT_RGB)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>trackFromVideo</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>ae7b67e97dfdcc851e27a39f73a96db65</anchor>
      <arglist>(const char *inVideoFileName, const char *outFbaFileName=NULL)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>trackFromRawImages</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a76fa48e42678b8371fe78ca558cb8cad</anchor>
      <arglist>(VisageTrackerFrameGrabber *frameGrabber, int width, int height, int format, int origin, const char *outFbaFileName=NULL)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>getTrackingData</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a888cf5073a33bc7658e193c0a39fedce</anchor>
      <arglist>(FaceData *data)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setTrackerConfigurationFile</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a03ea26287cf78864c0c3fd8e71e56df7</anchor>
      <arglist>(char *trackerConfigFile)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>attach</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>abd95ebff358b73527a107e9c81c2cb5f</anchor>
      <arglist>(VisageTrackerObserver *_obs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>detach</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a8af56d31d87e706df6fa45bc702a03d6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>showCameraSettingsDialog</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>aec74b335300ddcd7314640092804f41a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>FBAPs *</type>
      <name>getFBAPs</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a0c4717dfb98aace5b5b531e17c1fa860</anchor>
      <arglist>(long globalTime, FBAPs *lastFBAPs, VisageCharModel *model)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>start</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a26eb1d897af41e8d052c2326f26e496d</anchor>
      <arglist>(long globalTime)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>stop</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>aff1e3d0e4cb98e63e2ee9e4a4a35d666</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>char *</type>
      <name>actionTypeName</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a53765c77a7a5df057d9874abb48e6e92</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>DetectStrip</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a1767523ef2565e4bb8c345e81a5edffb</anchor>
      <arglist>(double &amp;size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setIPD</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a7ef8d42312facc63b7daf382310853dc</anchor>
      <arglist>(float value)</arglist>
    </member>
    <member kind="function">
      <type>float</type>
      <name>getIPD</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>a1c32bf2acdcfabab9bfdb47c2d75b30b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setDataBundle</name>
      <anchorfile>classVisageSDK_1_1VisageTracker2.html</anchorfile>
      <anchor>ac9635e5397a2b3e3b67d496def065ec8</anchor>
      <arglist>(NSBundle *bundle)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>VisageSDK::VisageTrackerObserver</name>
    <filename>classVisageSDK_1_1VisageTrackerObserver.html</filename>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Notify</name>
      <anchorfile>classVisageSDK_1_1VisageTrackerObserver.html</anchorfile>
      <anchor>ac97fdbbb4679d3d270cdbd2220920b55</anchor>
      <arglist>(VisageTracker2 *vt, long timeStamp)=0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>VisageSDK::VisageTrackerFrameGrabber</name>
    <filename>classVisageSDK_1_1VisageTrackerFrameGrabber.html</filename>
    <member kind="function" virtualness="pure">
      <type>virtual unsigned char *</type>
      <name>GrabFrame</name>
      <anchorfile>classVisageSDK_1_1VisageTrackerFrameGrabber.html</anchorfile>
      <anchor>aadce06772d63f30739606c67e6f1a663</anchor>
      <arglist>(long &amp;timeStamp)=0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>VisageSDK::TrackerOpenGLInterface</name>
    <filename>classVisageSDK_1_1TrackerOpenGLInterface.html</filename>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>setOpenGLContext</name>
      <anchorfile>classVisageSDK_1_1TrackerOpenGLInterface.html</anchorfile>
      <anchor>af92be9acf62fe66f93b407b3e293b53e</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>swapOpenGLBuffers</name>
      <anchorfile>classVisageSDK_1_1TrackerOpenGLInterface.html</anchorfile>
      <anchor>afd615d54eddb1e94dd83c0bcc1b2bd16</anchor>
      <arglist>()=0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>VisageSDK::TrackerGUIInterface</name>
    <filename>classVisageSDK_1_1TrackerGUIInterface.html</filename>
    <member kind="function" virtualness="pure">
      <type>virtual char *</type>
      <name>ChooseSuFileName</name>
      <anchorfile>classVisageSDK_1_1TrackerGUIInterface.html</anchorfile>
      <anchor>aa46d140965dae6a049ac618ed68b0361</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>displayMessage</name>
      <anchorfile>classVisageSDK_1_1TrackerGUIInterface.html</anchorfile>
      <anchor>aa5ca29d2471f900f324af1efe236ae07</anchor>
      <arglist>(char *userMessage, char *caption, int type)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>ManuallyAdjustShapeMask</name>
      <anchorfile>classVisageSDK_1_1TrackerGUIInterface.html</anchorfile>
      <anchor>affab75e881d5e611781161e8a799b282</anchor>
      <arglist>(float *face_translation, float *face_rotation, float *face_scale, float *face_shape)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>signalWhenUserReady</name>
      <anchorfile>classVisageSDK_1_1TrackerGUIInterface.html</anchorfile>
      <anchor>a9920c34fbb1deb5fadc2040a3b32d09a</anchor>
      <arglist>(char *userMessage, bool *readyFlag)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int</type>
      <name>selectMainFacialFeatures</name>
      <anchorfile>classVisageSDK_1_1TrackerGUIInterface.html</anchorfile>
      <anchor>a6f950cee4450e920046dd93748bc9caa</anchor>
      <arglist>(IplImage *input, FDP *output)=0</arglist>
    </member>
    <member kind="variable">
      <type>VisageTracker2 *</type>
      <name>vt2</name>
      <anchorfile>classVisageSDK_1_1TrackerGUIInterface.html</anchorfile>
      <anchor>acf411f1e874708f9783d7456fb84c53f</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>VisageSDK::TrackingData</name>
    <filename>structVisageSDK_1_1TrackingData.html</filename>
    <base>VisageSDK::FaceData</base>
    <member kind="function">
      <type></type>
      <name>TrackingData</name>
      <anchorfile>structVisageSDK_1_1TrackingData.html</anchorfile>
      <anchor>abea5fe647828dba2efa25437491f8d21</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>VisageSDK::FaceData</name>
    <filename>structVisageSDK_1_1FaceData.html</filename>
    <member kind="variable">
      <type>float</type>
      <name>trackingQuality</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a6aca0c311aeb0b3ee0eead93546235dd</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>frameRate</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a7138a72d57adc5ddb75d757bf0653dc1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>long</type>
      <name>timeStamp</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>af7afec396f9581356cc0b8fea4a10b9b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>faceTranslation</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a854b784b183fa4021e713506deff9845</anchor>
      <arglist>[3]</arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>faceRotation</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>ab5fe0bbe5ca937e2f2070c9fe07f3b82</anchor>
      <arglist>[3]</arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>gazeDirection</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a756d9a030db04d3e8686d8edd9c385ef</anchor>
      <arglist>[2]</arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>gazeDirectionGlobal</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a163adbed757c776cf6ce7556ec226e58</anchor>
      <arglist>[3]</arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>eyeClosure</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a4c494a1b319a79eade8191cd7e9b7b4c</anchor>
      <arglist>[2]</arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>actionUnitCount</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a05248f4d533bb6e4977ecba4eeb866d0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int *</type>
      <name>actionUnitsUsed</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a49a558930595aea1140415bc4acf3aba</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float *</type>
      <name>actionUnits</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a7fe570893d3cfda329549c2432450e5f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const char **</type>
      <name>actionUnitsNames</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a3b816d03c066223724aac966ec535deb</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>FBAPs *</type>
      <name>faceAnimationParameters</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>af15daaee4a0e1f4f60087ec2c3839588</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>FDP *</type>
      <name>featurePoints3D</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a1fd85018c51af5c63ac2d60eb6c9d91a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>FDP *</type>
      <name>featurePoints3DRelative</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>ad64b091d44f2358f2cd0e86d7b627a99</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>FDP *</type>
      <name>featurePoints2D</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a98c7a959cbde274d14a92ef191e7758c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>faceModelVertexCount</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>abc8b508113ddfce9ddc012420920ce40</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float *</type>
      <name>faceModelVertices</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a4e23ed5a39d923bd503e7e2fc59b10f0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float *</type>
      <name>faceModelVerticesProjected</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a9e799cc446b4bc942fdbbdf12bfab7a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>faceModelTriangleCount</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a710b1440e4969cb5ad3be4cacb3c1f0e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int *</type>
      <name>faceModelTriangles</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a8ee50ac55f282af229942fe4077b6434</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float *</type>
      <name>faceModelTextureCoords</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>aad53581671d541e68e7bf9e4619d3274</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>IplImage *</type>
      <name>frame</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a306fc247ad6223a52c1a840531680c1a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>cameraFocus</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>af3c8554e62965d5bac968c3e4aa5ec82</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>initFaceDetected</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a8945fb34c26fa41aad20eea4a686d62a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>initYaw</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>ae336d9fea95abd2663791da48071a11a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>initRoll</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>aa9f491dbc1f0d28f5f1ea8f2caf36716</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>initVelocity</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>af3c6d3f712331f1597dcbe7cf0df1e83</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>initDisplayStatus</name>
      <anchorfile>structVisageSDK_1_1FaceData.html</anchorfile>
      <anchor>a33899a52c4daf6edb7c70e56c03613aa</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>VisageSDK::FeaturePoint</name>
    <filename>structVisageSDK_1_1FeaturePoint.html</filename>
    <member kind="variable">
      <type>float</type>
      <name>pos</name>
      <anchorfile>structVisageSDK_1_1FeaturePoint.html</anchorfile>
      <anchor>a3b8e2c0bce305f9170f3f6d5bb597ea8</anchor>
      <arglist>[3]</arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>defined</name>
      <anchorfile>structVisageSDK_1_1FeaturePoint.html</anchorfile>
      <anchor>a1948b9ad64c7d20439d43e5f3e8446c3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>string</type>
      <name>surf</name>
      <anchorfile>structVisageSDK_1_1FeaturePoint.html</anchorfile>
      <anchor>a48c0152004a104fe0ecd1ff969d56f0e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>vert</name>
      <anchorfile>structVisageSDK_1_1FeaturePoint.html</anchorfile>
      <anchor>a698e7a8dd2f79613c005cc15a7fd31a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>norm</name>
      <anchorfile>structVisageSDK_1_1FeaturePoint.html</anchorfile>
      <anchor>a87c22bf593ed78da40fc996fd1f7d9d9</anchor>
      <arglist>[3]</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>VisageSDK::FDP</name>
    <filename>classVisageSDK_1_1FDP.html</filename>
    <member kind="function">
      <type></type>
      <name>FDP</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>acbbc90871ef46e7f1929b1a5698aac33</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>FDP</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a729b30519019ffc7ec1e3e107add0273</anchor>
      <arglist>(const FDP &amp;featurePoints)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>FDP</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a4c8aa74052cce70d4d1cf111696f1ccc</anchor>
      <arglist>(const char *fn, VisageCharModel *charModel=NULL)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>readFromFile</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a40e621eae2e12ad20544e28e45c0e402</anchor>
      <arglist>(const char *name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>createNewFile</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>ab3a48e821fcf6bc5f0c4a5a1cac7e654</anchor>
      <arglist>(const char *name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>saveToFile</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a9c0e7e25f393a9482d5e393a5d6fe6c2</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>saveToFile</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>ad2e8b69b482dde7ff6fa7c57a8d04d55</anchor>
      <arglist>(char *fileName)</arglist>
    </member>
    <member kind="function">
      <type>const FeaturePoint &amp;</type>
      <name>getFP</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a1a5507ba8c4fe8f640e63714e93e1757</anchor>
      <arglist>(int group, int n) const </arglist>
    </member>
    <member kind="function">
      <type>const FeaturePoint &amp;</type>
      <name>getFP</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a1b37c3c7b0aa21ce869f63b4f3e1d15b</anchor>
      <arglist>(const char *name) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setFP</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>acd6f3fc0f5752bfbe58575ed9e8746e4</anchor>
      <arglist>(int group, int n, const FeaturePoint &amp;f)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setFP</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a3d4f635b162820cac467852bd7c001cd</anchor>
      <arglist>(const char *name, const FeaturePoint &amp;f)</arglist>
    </member>
    <member kind="function">
      <type>const float *</type>
      <name>getFPPos</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a771f7b6d72f0fdef3531fa45092bf790</anchor>
      <arglist>(int group, int n) const </arglist>
    </member>
    <member kind="function">
      <type>const float *</type>
      <name>getFPPos</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a19adcc1acc0bcdf6526a027900a027a5</anchor>
      <arglist>(const char *name) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setFPPos</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>af5104bfb7b793a9f584ee06bd698a6c0</anchor>
      <arglist>(int group, int n, const float *pos)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setFPPos</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a224157c63573689aa13209f62ee13cc0</anchor>
      <arglist>(const char *name, const float *pos)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setFPPos</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a90a288134b10bd0a2a0de17b99997336</anchor>
      <arglist>(int group, int n, float x, float y, float z)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setFPPos</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a45f3965e87b0ee16d2c7f3c85edc45cb</anchor>
      <arglist>(const char *name, float x, float y, float z)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>getFPSurfVert</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a70f3a5cb4b97a52aac84b086edc19650</anchor>
      <arglist>(int group, int n, string &amp;surf, int &amp;vert) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>getFPSurfVert</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a1af7c284a72d416003b832d2dedc3bc3</anchor>
      <arglist>(const char *name, string &amp;surf, int &amp;vert) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setFPSurfVert</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a474e9220ab0379e42cc1404d42b5cb93</anchor>
      <arglist>(int group, int n, const string &amp;surf, int vert)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setFPSurfVert</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>ab9f256628bba2b3cd6e5acd393e98096</anchor>
      <arglist>(const char *name, const string &amp;surf, int vert)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reset</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a822c3475d4533100c322c792b8ad563b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>FPIsDefined</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a2a9b0403969e106c716ff9d103fb7972</anchor>
      <arglist>(int group, int n) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>FPIsDefined</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a3a3a6f713b5a12cfde48f7afff9fd176</anchor>
      <arglist>(const string &amp;name) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setNormFactors</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a143b63d5d326cda519f34bde8c960188</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>print</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a86bbbddc689b4ccafa5614f9b0206e18</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>parseFPName</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a072008a817b698a1ebb79076b510b1b4</anchor>
      <arglist>(const string &amp;name, int &amp;group, int &amp;n)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static string</type>
      <name>getFPName</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>ab27608c6a1afeeb4a9dbbae110132d7f</anchor>
      <arglist>(int group, int n)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static bool</type>
      <name>FPIsValid</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a1f742eb9a07b8f70c3fa2e54337ccb88</anchor>
      <arglist>(int group, int n)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static bool</type>
      <name>FPIsValid</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>af4bf9ccd02115a7c0e8d16936dc069a3</anchor>
      <arglist>(const string &amp;name)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static int</type>
      <name>groupSize</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>af522a5088cb36697f9856bb5b1cdbc55</anchor>
      <arglist>(int group)</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int</type>
      <name>FP_START_GROUP_INDEX</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a9afadd826530080f26d6aec13a03a789</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int</type>
      <name>FP_END_GROUP_INDEX</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a4b7f96c1565a4573c8ca07aff3c609d0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int</type>
      <name>FP_NUMBER_OF_GROUPS</name>
      <anchorfile>classVisageSDK_1_1FDP.html</anchorfile>
      <anchor>a5d818481dbb7de66f5b1f464a08b7b15</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>VisageSDK::VisageFeaturesDetector</name>
    <filename>classVisageSDK_1_1VisageFeaturesDetector.html</filename>
    <member kind="function">
      <type></type>
      <name>VisageFeaturesDetector</name>
      <anchorfile>classVisageSDK_1_1VisageFeaturesDetector.html</anchorfile>
      <anchor>ac4a75ef862227ed7edd84c9a621dce9d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~VisageFeaturesDetector</name>
      <anchorfile>classVisageSDK_1_1VisageFeaturesDetector.html</anchorfile>
      <anchor>a2b5ccb544e23a6255c88476b18dd928b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Initialize</name>
      <anchorfile>classVisageSDK_1_1VisageFeaturesDetector.html</anchorfile>
      <anchor>ad23a5d91f896b82fa7f88dc3b9532e1a</anchor>
      <arglist>(const char *path)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>detectFacialFeatures</name>
      <anchorfile>classVisageSDK_1_1VisageFeaturesDetector.html</anchorfile>
      <anchor>a99cb134a428fd0fc45afd7e1af716a31</anchor>
      <arglist>(IplImage *frame, FaceData *output, int maxFaces=1)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>detectFacialFeatures</name>
      <anchorfile>classVisageSDK_1_1VisageFeaturesDetector.html</anchorfile>
      <anchor>aea9695638b1fabac55b7833cac6ea49a</anchor>
      <arglist>(const char *imageFileName, FaceData *output, int maxFaces=1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>drawResults</name>
      <anchorfile>classVisageSDK_1_1VisageFeaturesDetector.html</anchorfile>
      <anchor>af910ae5caf2ddc071e8ef3c204612130</anchor>
      <arglist>(IplImage *img)</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>API</title>
    <filename>index</filename>
    <docanchor file="index">visageVision-d</docanchor>
    <docanchor file="index">visageVision-t</docanchor>
  </compound>
</tagfile>
