float[] pointX;
float[] pointY;
int i = 50; 
int r = 50;

void setup() {
  size(700, 700); // set size of screen
  background(0); // set background color
  stroke(255); // set stroke color (for points)

  pointX = new float [50]; // assign random arrays of points in x axis
  pointY = new float [50]; // assign random arrays of points in y axis

  for (i=0; i<50; i++) { // being a for loop to create 50 random points on the screen
    pointX[i] = random (0, 700); // assign 50 random points in x axis
    pointY[i] = random (0, 700); // assign 50 random points in y axis
    
    beginShape(POINTS); // being creating points
    strokeWeight(10); // set point stroke
    vertex (pointX[i], pointY[i]); // create a random point on screen
    endShape(); // point created
    }
    
    stroke(245,64,65,50); // set stroke color and transparency (for line)
    strokeWeight(1); // set stroke weight
    for (i=0; i<50; i++) { // begin for loop to a line from one point to another point
      // line (pointX[i], pointY[i], pointX[i+1], pointY[i+1]); // this is a redundant comment
        for (r=0; r<50; r++) { // //being loop to connect one point to 49 other points through a line
          line (pointX[i], pointY[i], pointX[r], pointY[r]); // draw lines from one point to 49 other points
      }
    } 
}

void draw() {
  
}
