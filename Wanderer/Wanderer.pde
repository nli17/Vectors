//declare variables
float diam;
PVector loc, vel, acc;

void setup() {
  //set size of canvas
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  
  //initialize variables
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();
  vel.mult(1);
  acc = PVector.random2D();
  acc.mult(.01);
  diam = 80;
}

void draw() {
  fill(frameCount%360, 70, 80);
  acc = PVector.random2D();
  acc.mult(.1);
  
  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
 
  //add velocity to position

  vel.add(acc);
  vel.limit(5);
  loc.add(vel);
  
  //wrap the ball's position
  if (loc.x >= width) {
    loc.x = 0;
  } else if (loc.x <= 0) {
    loc.x = width;
  }
  if (loc.y >= height) {
    loc.y = 0;
  } else if (loc.y <= 0) {
    loc.y = height;
  }
}  