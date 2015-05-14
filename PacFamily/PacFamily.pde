import ddf.minim.* ;
Minim minim;  // load sound file
AudioPlayer au_player1;
AudioPlayer au_player2;

ArrayList plist = new ArrayList(); 

int time;

// declare variables to use
   PImage pacMan;
   PImage pacWoman;
   PImage cherry;
   PImage orange;
   PImage strawberry;
   
   int orangeEaten;
   int cherryEaten;
   int strawberryEaten;
   
   PImage ghost1;
   PImage ghost2;
   PImage ghost3;
   PImage ghost4;
   
   int pacManx,pacMany;
   int pacWomanx, pacWomany;

   int cherryx, cherryy;
   int orangex, orangey;
   int strawberryx, strawberryy;
   
   int ghost1x, ghost1y;
   int ghost2x, ghost2y;
   int ghost3x, ghost3y;
   int ghost4x, ghost4y;
   
   int fruitflag=0;
   int loseflag=0;
   int pacshowflag=0;
   
   int ghost1direction;
   int ghost2direction;
   int ghost3direction;
   int ghost4direction;
   
   
void setup()
{
// load and play the background music
   minim = new Minim(this);
   au_player1 = minim.loadFile("pacmanMusic.wav");
   au_player1.play();
   au_player1.loop();
 
// define size of canvas
   size(750,750);
   
// load all the images and their respective postitions
   pacMan = loadImage("pacMan1.png");
   pacMan.resize(40,40);
   pacWoman = loadImage("pacWoman1.png");
   pacWoman.resize(40,40);
   cherry = loadImage("cherry.png");
   cherry.resize(40,40);
   orange = loadImage("orange.png");
   orange.resize(40,40);
   strawberry = loadImage("strawberry.png");
   strawberry.resize(40,40);
   ghost1 = loadImage("ghost1.png");
   ghost1.resize(40,40);
   ghost2 = loadImage("ghost2.png");
   ghost2.resize(40,40);
   ghost3 = loadImage("ghost3.png");
   ghost3.resize(40,40);
   ghost4 = loadImage("ghost4.png");
   ghost4.resize(40,40);
   
   pacManx=100; 
   pacMany=650;
   pacWomanx=600;
   pacWomany=650;
   ghost1x=100;
   ghost1y=500;
   ghost2x=600;
   ghost2y=325;
   ghost3x=100;
   ghost3y=200;
   ghost4x=600;
   ghost4y=100;
   
   cherryx= 400;
   cherryy= 325;
   orangex= 600;
   orangey= 500;  
   strawberryx= 600;
   strawberryy= 200;
   
   orangeEaten=0;
   cherryEaten=0;
   strawberryEaten=0;
   
   ghost1direction =1;
   ghost2direction =0;
   ghost3direction =1;
   ghost4direction =0;
}


void draw()
{
  background(0);
  frameRate(60); // how many times draw() is called per second
 
// reposition all the images as the player makes his/her move
 if(pacshowflag==0){ // this condition supports the delay after the game is reset (hiding pac man & woman)
    image(pacMan, pacManx, pacMany);
    image(pacWoman, pacWomanx, pacWomany);
    }
 
  image(ghost1, ghost1x, ghost1y);
  image(ghost2, ghost2x, ghost2y);
  image(ghost3, ghost3x, ghost3y);
  image(ghost4, ghost4x, ghost4y);
  image(cherry, cherryx, cherryy);
  image(orange, orangex, orangey);
  image(strawberry, strawberryx, strawberryy);

// on collision with ghosts update particle positions
  for(int i = 0; i < plist.size(); i++) {
    Particle p = (Particle) plist.get(i);
    //makes p a particle equivalent to ith particle in ArrayList
    p.grav1=p.grav1*10;
    p.run();
    p.update();
    p.gravity();
}

// Since the keyPressed function is not able to recognize continously pressed key for alphabets,
// I am using keyPressed variable to achive the same
if(keyPressed){
  
 if (key == 'S'||key=='s'){
    if(pacManx>=700)
    {
      pacManx-=10;   
    }  
  else
    {
      pacManx+=10;    
    }
  }

if (key == 'A'||key=='a'){
    if(pacManx<=30)
    {
      pacManx+=10;   
    }  
  else
    {
      pacManx-=10;    
    }
  }

if (key == 'F'||key=='f'){
    if(pacWomanx>=700)
    {
      pacWomanx-=10;   
    }  
  else
    {
      pacWomanx+=10;    
    }
  }

if (key == 'D'||key=='d'){
    if(pacWomanx<=30)
    {
      pacWomanx+=10;   
    }  
  else
    {
      pacWomanx-=10;   
    }
  }
}

// change ghost's direction upon hitting boundary
switch (ghost1direction) {
    case 0:
      ghost1x=ghost1x-10;
      if (ghost1x<=0) {
        ghost1direction=1;
      }
      break;
    case 1:
      ghost1x=ghost1x+10;
      if (ghost1x>=750) {
        ghost1direction=0;
      }
      break;
        default:
      break;
  }

switch (ghost2direction) {
    case 0:
      ghost2x=ghost2x-15;
      if (ghost2x<=0) {
        ghost2direction=1;
      }
      break;
    case 1:
      ghost2x=ghost2x+15;
      if (ghost2x>=750) {
        ghost2direction=0;
      }
      break;
        default:
      break;
  }
 
switch (ghost3direction) {
    case 0:
      ghost3x=ghost3x-18;
      if (ghost3x<=0) {
        ghost3direction=1;
      }
      break;
    case 1:
      ghost3x=ghost3x+18;
      if (ghost3x>=750) {
        ghost3direction=0;
      }
      break;
        default:
      break;
  }
switch (ghost4direction) {
    case 0:
      ghost4x=ghost4x-17;
      if (ghost4x<=0) {
        ghost4direction=1;
      }
      break;
    case 1:
      ghost4x=ghost4x+17;
      if (ghost4x>=750) {
        ghost4direction=0;
      }
      break;
        default:
      break;
  }

// check if pac man or woman has eaten Cherry
 if ((((pacManx>=385) && (pacManx<=415) ) && ((pacMany>=310) && (pacMany<=340)))
    || (((pacWomanx>=385) && (pacWomanx<=415)) && ((pacWomany>=310) && (pacWomany<=340))))
  {
    cherryy=10;
    cherryx=20;
       if (cherryEaten==0) {
         fruitflag++;
         cherryEaten=1;
      }
    image(cherry, cherryx, cherryy);
  }
  
// check if pac man or woman has Orange cherry
if ((((pacManx>=585) && (pacManx<=615)) && ((pacMany>=485) && (pacMany<=515)))
    || (((pacWomanx>=585) && (pacWomanx<=615)) && ((pacWomany>=485) && (pacWomany<=515))))
  {
    orangey=10;
    orangex=60;
        if (orangeEaten==0) {
          fruitflag++;
          orangeEaten=1;
      }
    image(orange, orangex, orangey);
  }
  
// check if pac man or woman has Strawberry cherry
  if ((((pacManx>=585) && (pacManx<=615) ) && ((pacMany>=185) && (pacMany<=215)))
    || (((pacWomanx>=585) && (pacWomanx<=615)) && ((pacWomany>=185) && (pacWomany<=215))))
  {
    strawberryy=10;
    strawberryx=100;
        if (strawberryEaten==0) {
          fruitflag++;
          strawberryEaten=1;
      }
    image(strawberry, strawberryx, strawberryy);
  }
  
// check if pac man has collided with any of the four ghosts
  if (
    (((pacManx>=ghost1x-25) && (pacManx<=ghost1x+25) )&& ((pacMany>=ghost1y-25 ) && (pacMany<=ghost1y+25)))
    ||
    (((pacManx>=ghost2x-25) && (pacManx<=ghost2x+25) )&& ((pacMany>=ghost2y-25 ) && (pacMany<=ghost2y+25)))
    ||
    (((pacManx>=ghost3x-25) && (pacManx<=ghost3x+25) )&& ((pacMany>=ghost3y-25 ) && (pacMany<=ghost3y+25)))
    ||
    (((pacManx>=ghost4x-25) && (pacManx<=ghost4x+25) )&& ((pacMany>=ghost4y-25 ) && (pacMany<=ghost4y+25)))
    )
  {
    loseflag=1;
    // play death sound
     minim = new Minim(this);
     au_player2 = minim.loadFile("pacmanDeath.wav");
     au_player2.play();
  }
  
// check if pac woman has collided with any of the four ghosts
   if (
    (((pacWomanx>=ghost1x-25) && (pacWomanx<=ghost1x+25) )&& ((pacWomany>=ghost1y-25 ) && (pacWomany<=ghost1y+25)))
    ||
    (((pacWomanx>=ghost2x-25) && (pacWomanx<=ghost2x+25) )&& ((pacWomany>=ghost2y-25 ) && (pacWomany<=ghost2y+25)))
    ||
    (((pacWomanx>=ghost3x-25) && (pacWomanx<=ghost3x+25) )&& ((pacWomany>=ghost3y-25 ) && (pacWomany<=ghost3y+25)))
    ||
    (((pacWomanx>=ghost4x-25) && (pacWomanx<=ghost4x+25) )&& ((pacWomany>=ghost4y-25 ) && (pacWomany<=ghost4y+25)))
    )
  {
    loseflag=2;
    // play death sound
     minim = new Minim(this);
     au_player2 = minim.loadFile("pacmanDeath.wav");
     au_player2.play();
  }
 
// set reset flag as pac man collided with ghost and create particle at pac man's position
  if(loseflag==1)
  {
    fruitflag=3;
    loseflag=0;
    //particles
    for (int i = 0; i < 10; i ++) {
    plist.add(new Particle(pacManx,pacMany)); // fill ArrayList with particles
 
    if(plist.size() > 10) {
      plist.remove(0);
    }  
  }
}

// set reset flag as pac woman collided with ghost and create particle at pac woman's position
if(loseflag==2)
  {
    fruitflag=3;
    loseflag=0;
    //particles
    for (int i = 0; i < 10; i ++) {
    plist.add(new Particle(pacWomanx,pacWomany)); // fill ArrayList with particles
 
    if(plist.size() > 10) {
      plist.remove(0);
    }  
  }
}

// resetting all the image positions and different flags used i.e. reset game to start again
// we reset game on two conditions
// 1. LOSE: pac man or woman collided with any of the four ghosts
// 2. WIN: user successfully ate all three fruits
  if(fruitflag==3)
  {
   pacMan = loadImage("pacMan1.png");
   pacMan.resize(40,40);
   pacWoman = loadImage("pacWoman1.png");
   pacWoman.resize(40,40);
   cherry = loadImage("cherry.png");
   cherry.resize(40,40);
   orange = loadImage("orange.png");
   orange.resize(40,40);
   strawberry = loadImage("strawberry.png");
   strawberry.resize(40,40);
   ghost1 = loadImage("ghost1.png");
   ghost1.resize(40,40);
   ghost2 = loadImage("ghost2.png");
   ghost2.resize(40,40);
   ghost3 = loadImage("ghost3.png");
   ghost3.resize(40,40);
   ghost4 = loadImage("ghost4.png");
   ghost4.resize(40,40);

   orangeEaten=0;
   cherryEaten=0;
   strawberryEaten=0;
   pacshowflag=1;
   time=millis();
      
   pacManx=100; 
   pacMany=650;
   pacWomanx=600;
   pacWomany=650;
   ghost1x=100;
   ghost1y=500;
   ghost2x=600;
   ghost2y=325;
   ghost3x=100;
   ghost3y=200;
   ghost4x=600;
   ghost4y=100;
   
   cherryx= 400;
   cherryy= 325;
   orangex= 600;
   orangey= 500;  
   strawberryx= 600;
   strawberryy= 200;
   
   fruitflag=0;
  }
  
  if(pacshowflag==1){
    if(millis()-time>2000){
      pacshowflag=0;
      time=millis();
      }
    }
}

void keyPressed()
{
//move both pacs up and down at the same time
  if (keyCode == UP){
    if(pacMany<=50 || pacMany<=50){
       pacMany+=10;
       pacWomany+=10;
     }  
    else{
      pacMany-= 10;
      pacWomany-= 10; 
   }
 }
  
  if (keyCode == DOWN){
    if(pacMany>=700 || pacWomany>=700){
       pacMany-=10;
       pacWomany-=10;
    }  
   else{
      pacMany+=10;
      pacWomany+=10;   
   }
 }
 
}

//declaring the class particle to be used upon collide with ghosts
class Particle {
  float r = 7 ;
  PVector pos,speed,grav;
  ArrayList tail;
  float splash = 5;
  float margin = 8;
  int taillength = 5;
  float grav1=0.2;
 
  Particle(float tempx, float tempy) {
    float startx = tempx + random(-splash,splash);
    float starty = tempy + random(-splash,splash);
    startx = constrain(startx,0,width);
    starty = constrain(starty,0,height);
    float xspeed = random(-3,3);
    float yspeed = random(-3,3);
 
    pos = new PVector(startx,starty);
    speed = new PVector(xspeed,yspeed);
    grav = new PVector(0,grav1);
     
    tail = new ArrayList();
  }
 
  void run() {
    pos.add(speed);
 
    tail.add(new PVector(pos.x,pos.y,0));
    if(tail.size() > taillength) {
      tail.remove(0);
    }
 
//    float damping = random(-0.5,-0.6);
//    if(pos.x > width - margin || pos.x < margin) {
//      speed.x *= damping;
//    }
//    if(pos.y > height -margin) {
//      speed.y *= damping;
//    }
  }
 
  void gravity() {
    speed.add(grav);
  }
 
  void update() {
    for (int i = 0; i < tail.size(); i++) {
      PVector tempv = (PVector)tail.get(i);
      noStroke();
      fill(255,241,0);
      ellipse(tempv.x,tempv.y,r,r);

    }
  }
}
