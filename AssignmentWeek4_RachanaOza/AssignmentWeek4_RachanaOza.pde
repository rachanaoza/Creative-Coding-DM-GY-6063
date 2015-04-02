// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

PVector wind;
float changeby;

Mover[] movers = new Mover[5]; // creating an array with 5 Mover objects

void setup() {
  size(800, 600); // declaring size of screen
  randomSeed(1);  // begin program with same random number

  for (int i = 0; i < movers.length; i++) { // assigning mover arrays with new Movers
    movers[i] = new Mover(random(5, 12),random(0, width), 0); // random mass from 5-12, random width from 0 to width of screen, y-position is 0
  }
  
   wind = new PVector(2.5, 0); // creating PVector for wind
   changeby = wind.x; // on change altering the value of wind by 2.5
}


void draw() {
 background(0); // setting background as black
 
 for (int i = 0; i < movers.length; i++) { // draring arrays for the movers
 
    float moverMass = movers[i].mass; // create floating mass values

    PVector gravity = new PVector(0, 0.1*movers[i].mass); // create a new PVector for gravity
    
    float c = 0.05;
    PVector friction = movers[i].velocity.get(); // setting friction
    friction.mult(-1); // make friction opposite of current velocity (decelerate)
    friction.normalize(); // setting magnitude of friction to 1
    friction.mult(c); // scaling friction vector by 5%
 
    movers[i].applyForce(friction); // apply friction on start
    // movers[i].applyForce(wind); we do not want to apply wind on start of program
    movers[i].applyForce(gravity); // apply gravity on start

    movers[i].update(); // apply motion to each mover
    movers[i].display(); // apply color attributes to each mover
    movers[i].checkEdges(); // make sure each mover is within boundaries
  }
 
 
  if (keyPressed) { // do something on key press
    
    if(key=='d') // on pressing 'd' apply wind towards right (from left to right)
    {
      for (int i = 0; i < movers.length; i++) {
        wind.x= 10*(changeby/movers[i].mass);
        movers[i].applyForce(wind);
      }
    }   
    
    if(key=='a') // on pressing 'a' apply wind towards left (from right to left)
    {
      for (int i = 0; i < movers.length; i++) {
        wind.x = -10 * (changeby/movers[i].mass);
        movers[i].applyForce(wind);
      }
    } 
  }
}

void mousePressed(){ // refresh screen on mouse press
  setup();
}
