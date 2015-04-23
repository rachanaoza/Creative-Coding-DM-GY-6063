/* THIS IS THE OLD CODE
var ball = [];
var noOfBalls = 5;


function setup(){
	createCanvas(800,600);
	for (var i = 0; i < noOfBalls; i++) {	
		ball[i] = new Shape(color(random(0,255),random(0,255),random(0,255)));
	}
}


function draw(){
	background(0);

	for (var i = 0; i < noOfBalls; i++) {
		ball[i].display();
	}
}


function Shape(ranColor){
	// fill(random(0,255),random(0,255),random(0,255));
	
	this.x = random(0,width);
	//this.y = random(0,height);	
	this.diameter = random(30,100);
	// fill(random(0,255),random(0,255),random(0,255));
  	this.display = function(){
  		fill(ranColor);
	    ellipse(this.x, 10, this.diameter, this.diameter);
    }
}
*/



var movers = [];

function setup() {
  createCanvas(640, 360);
  for (var i = 0; i < 5; i++) {
    movers[i] = new Mover(random(1, 5), random(0,width), 0, color(random(0,255),random(0,255),random(0,255)), random(10,60));
  }
}

function draw() {
  background(0);
  
  for (var i = 0; i < movers.length; i++) {
    var wind = createVector(0.01, 0);
    var gravity = createVector(0, 0.1);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}
