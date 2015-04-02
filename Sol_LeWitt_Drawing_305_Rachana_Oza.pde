int count = 0;
float xposition1, xposition2, yposition1, yposition2;


void setup(){
  size(600,600); // set screen size
  background(35); // set background color

  stroke(0,255,0); // stroke color for line
  strokeWeight(2); // stroke width for line
  line (600,0, 450, 600); // location of the line
  
  noFill(); // arc with no fill
  arc(400, 400, 300, 300, -HALF_PI, PI);
    
//  ellipseMode (CENTER);
//    stroke(255,0,0);
//  ellipse (522,313,5,5);
//  ellipse( 466,535,5,5);
//
//  
//  line(522,313,467,534);
//  
//  ellipseMode(CENTER);
//    fill(0,0,255);
//    stroke(0,0,255);
//  ellipse ((522+466)/2, (313+535)/2,5,5);
}

void draw(){
  }
  
//This is to figure out the two intersecting points   

void mousePressed(){
println(mouseX,mouseY);
stroke(255,0,0);
fill(255,0,0);

if (count < 2){
  ellipse((pmouseX+mouseX)/2,(pmouseY+mouseY)/2,5,5);
  if (count == 0){
    xposition1 = mouseX;
    yposition1 = mouseY;}
  
  if (count == 1){
    xposition2 = mouseX;
    yposition2 = mouseY;
    
  line (xposition1, yposition1, xposition2, yposition2); 
  fill(255); 
  stroke(255);
  ellipse((xposition1+xposition2)/2,(yposition1+yposition2)/2,7,7);
}
  
  count ++;
}
}
