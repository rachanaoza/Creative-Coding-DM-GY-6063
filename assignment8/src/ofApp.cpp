#include "ofApp.h"


//--------------------------------------------------------------
void ofApp::setup(){
	
// declare all the images
	pacImg.loadImage("pacman.png");
	redImg.loadImage("red man.png");
	oragImg.loadImage("orange man.png");
	blueImg.loadImage("blue man.png");
	pinkImg.loadImage("pink man.png");
	
	appleImg.loadImage("apple.png");
	cherryImg.loadImage("cherry.png");
	berryImg.loadImage("strawberry.png");
	
//assign X and Y positions and their directions
	pacX=600;
	pacY=650;
	
	redX=100;
	redY=550;
	redDirection=1;
	
	oragX=600;
	oragY=400;
	oragDirection=0;
	
	blueX=100;
	blueY=250;
	blueDirection=1;
	
	pinkX=600;
	pinkY=100;
	pinkDirection=0;
	
	cherryX=400;
	cherryY=325;
	
	appleX=600;
	appleY=500;
	
	berryX=600;
	berryY=200;
	
}

//--------------------------------------------------------------
void ofApp::update(){
	ofBackground(0,0,0);
}


//--------------------------------------------------------------
void ofApp::draw(){
	
//assign Pacman its position on the screen
	pacImg.draw(pacX,pacY,50,50);
	
//reverse direction of characters once they hit the walls
	if (redDirection==0) {
		redX=redX-10;
		
		if (redX<=0) {
			redDirection=1;
		}
		
	}
	
	if (redDirection==1) {
		redX=redX+10;
		
		if (redX>=700) {
			redDirection=0;
		}
		
	}
	
	
	if (oragDirection==0) {
		oragX=oragX-15;
		
		if (oragX<=0) {
			oragDirection=1;
		}
		
	}
	
	if (oragDirection==1) {
		oragX=oragX+15;
		
		if (oragX>=700) {
			oragDirection=0;
		}
		
	}
	
	
	if (blueDirection==0) {
		blueX=blueX-15;
		
		if (blueX<=0) {
			blueDirection=1;
		}
		
	}
	
	if (blueDirection==1) {
		blueX=blueX+15;
		
		if (blueX>=700) {
			blueDirection=0;
		}
		
	}
	
	
	if (pinkDirection==0) {
		pinkX=pinkX-20;
		
		if (pinkX<=0) {
			pinkDirection=1;
		}
		
	}
	
	if (pinkDirection==1) {
		pinkX=pinkX+20;
		
		if (pinkX>=700) {
			pinkDirection=0;
		}
		
	}
	
// assign individual characters their positions
	redImg.draw(redX,redY,50,50);
	oragImg.draw(oragX,oragY,50,50);
	blueImg.draw(blueX,blueY,50,50);
	pinkImg.draw(pinkX,pinkY,50,50);
	
// assign individual fruits their positions
	appleImg.draw(appleX,appleY,30,30);
	cherryImg.draw(cherryX,cherryY,30,30);
	berryImg.draw(berryX,berryY,30,30);
	
	
// when Pacman touches the fruits, reposition them (fruits are eaten)
	if (((pacX>=585) && (pacX<=615) ) && ((pacY>=485 ) && (pacY<=515))){
		appleX=30;
		appleY=30;
	}
	
	if (((pacX>=385) && (pacX<=415) ) && ((pacY>=310 ) && (pacY<=340))){
		cherryX=105;
		cherryY=30;
	}
	

	if (((pacX>=585) && (pacX<=615) ) && ((pacY>=185 ) && (pacY<=215))){
		berryX=180;
		berryY=30;
	}
	
// if Pacman touches other characters, set it back to its original position
	if (
		(((pacX>=redX-25) && (pacX<=redX+25) )&& ((pacY>=redY-25 ) && (pacY<=redY+25)))
		||
		(((pacX>=oragX-25) && (pacX<=oragX+25) )&& ((pacY>=oragY-25 ) && (pacY<=oragY+25)))
		||
		(((pacX>=blueX-25) && (pacX<=blueX+25) )&& ((pacY>=blueY-25 ) && (pacY<=blueY+25)))
		||
		(((pacX>=pinkX-25) && (pacX<=pinkX+25) )&& ((pacY>=pinkY-25 ) && (pacY<=pinkY+25)))
		)
	{
		setup();
		
	}
	
	
	phase += 0.35f;
	
	
	ofEnableAlphaBlending();

// code for the rotating squares
	ofSetColor(255,255,255,50);
	glPushMatrix();
	glTranslatef(appleX+15,appleY+15,0);
	glRotatef(phase*5, 0,0,1);
	ofRect(-25,-25,50,50);
	glPopMatrix();
	
	ofSetColor(255,255,255,50);
	glPushMatrix();
	glTranslatef(cherryX+15,cherryY+15,0);
	glRotatef(phase*5, 0,0,1);
	ofRect(-25,-25,50,50);
	glPopMatrix();
	
	ofSetColor(255,255,255,50);
	glPushMatrix();
	glTranslatef(berryX+15,berryY+15,0);
	glRotatef(phase*5, 0,0,1);
	ofRect(-25,-25,50,50);
	glPopMatrix();
	
	
	ofDisableAlphaBlending();
	
	
	
	if (bSnapshot == true){
		// grab a rectangle at 200,200, width and height of 300,180
		img.grabScreen(200,200,300,180);

		string fileName = "snapshot_"+ofToString(10000+snapCounter)+".png";
		img.saveImage(fileName);
		sprintf(snapString, "saved %s", fileName.c_str());
		snapCounter++;
		bSnapshot = false;
	}

	ofDrawBitmapString(snapString, 600,460);


	ofSetHexColor(0xFFFFFF);
	if(snapCounter > 0) {
        img.draw(600,200,300,180);
	}
	
	

}


//--------------------------------------------------------------
void ofApp::keyPressed  (int key){

// assign keys for moving Pacman
	if (key == 'a'){
		
		if (pacX<=0) {
			pacX=0;
		} else  {
			pacX=pacX-11;
		}
	}
	
	
	if (key == 'd'){
		
		if (pacX>=700) {
			pacX=700;
		} else  {
			pacX=pacX+11;
		}
	}
	
	
	if (key == 'w'){
		
		if (pacY<=0) {
		pacY=0;
		} else  {
			pacY=pacY-11;
		}
	}
	
	
	if (key == 's'){
		
		if (pacY>=700) {
			pacY=700;
		} else  {
			pacY=pacY+11;
		}
	}
	
	
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){
	
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){

}

//--------------------------------------------------------------