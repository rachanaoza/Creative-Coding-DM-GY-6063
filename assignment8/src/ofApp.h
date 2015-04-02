#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{
	
	public:
		
		void setup();
		void update();
		void draw();
		
		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void windowResized(int w,int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);
	
		int 				snapCounter;
		char 				snapString[255];
	
		int					pacX;
		int					pacY;
	
		int					redX;
		int					redY;
	
		int					redDirection;
		int					oragDirection;
		int					blueDirection;
		int					pinkDirection;

		int					oragX;
		int					oragY;

		int					blueX;
		int					blueY;
	
		int					pinkX;
		int					pinkY;
	
		int					cherryX;
		int					cherryY;
	
		int					appleX;
		int					appleY;
	
		int					berryX;
		int					berryY;

		ofImage 			img;
	
		ofImage				pacImg;
		ofImage				redImg;
		ofImage				oragImg;
		ofImage				blueImg;
		ofImage				pinkImg;
	
		ofImage				appleImg;
		ofImage				cherryImg;
		ofImage				berryImg;
	
	
		ofTrueTypeFont		centuryGothic;
		bool 				bSnapshot;
		float 				phase;
		
		
};