//declare variables
int count= 1000;
float []diam = new float [count];
PVector []loc= new PVector [count]; 
PVector []vel= new PVector [count];

void setup() {
  //set size of canvas
  size(600, 600);
  for (int i = 0; i < count; i++) {
    //initialize variables
    loc[i]= new PVector(width/2, height/2);
    vel[i] = PVector.random2D();
    diam[i] = 30;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for (int i=0; i<count; i++) {
    //draw ball
    ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

    //add velocity to position
    loc[i].add(vel[i]);

    //bounce ball if it hits walls
    if (loc[i].x + diam[i]/2 >= width) {
      vel[i].x = -abs(vel[i].x);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (loc[i].x - diam[i]/2 <= 0) {
      vel[i].x = abs(vel[i].x);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (loc[i].y + diam[i]/2 >= height) {
      vel[i].y = -abs(vel[i].y);
    } else if (loc[i].y - diam[i]/2 <= 0) {
      vel[i].y = abs(vel[i].y);
    }
  }
}