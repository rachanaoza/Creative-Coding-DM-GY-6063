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
	this.x = random(0,width);
	
	this.diameter = random(30,100);
	this.y=0;
  	this.display = function(){
  		fill(ranColor);
	    ellipse(this.x, 10, this.diameter, this.diameter);
    
    }
}