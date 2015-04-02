// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover { // attributes/variables of the movers
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  color rgb;
 
  Mover(float m, float x, float y) { // constructor
    mass = m; // mass of the movers
    location = new PVector(x,y); // location of the movers
    velocity = new PVector(0,0); // velocity of the movers
    acceleration = new PVector(0,0); // accelration of the movers
    rgb = color(255,255,255); // color of the movers
  }
  
  void applyForce(PVector force) { // defining force
    PVector f = PVector.div(force, mass);
//    PVector f = new PVector (0,0);
//    force.div(mass);
//    acceleration.add(force);
    acceleration.add(f);
  }
  
  void update() { // defining the motion(s) of the movers
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
 
  void display() { // defining display for the movers (ellipses)
    stroke(0);
    strokeWeight(1);
    fill(rgb);
    ellipse(location.x, location.y, 10*mass, 10*mass);
  }
 

  void checkEdges() { // make sure the movers stay within the limits of the screen
    if (location.x > width) { // if x-location of movers exceeds width make it bounce back
      location.x = width;
      velocity.x *= -1;
      rgb = color(random(0,255),random(0,255),random(0,255));
      display();
    }
 
     if (location.x < 0) { // if x-location of movers goes below 0 make it bounce back
      location.x = 0;
      velocity.x *= -1;
      rgb = color(random(0,255),random(0,255),random(0,255));
      display();
    }
 
    if (location.y > height) { // if y-location of movers exceeds height make it bounce back
      location.y = height;
      velocity.y *= -1;
    }
  }
}
