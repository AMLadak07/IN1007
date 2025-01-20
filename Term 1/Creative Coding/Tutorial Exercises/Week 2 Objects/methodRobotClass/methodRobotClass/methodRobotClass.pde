// -- Exploring Methods and Classes with Robots

// -- global variables
float x, y;
float wide, high;
float eyeD, eyeR, mLong, mDown;

void setup () {
  
  size(400,400);
  rectMode(CENTER);  // <-- look this up to see what the rectMode() method does
  
  // -- variable values set here to pass to drawRobot();
  x = 200;
  y = 200;
  wide = 120;
  high = 100;
  eyeD = 60;
  eyeR = 20;
  mLong = 95;
  mDown = 30;
}

void draw() {
  background(250);
  
  // -- Method approach to drawing:
  drawRobot(x,y, wide,high, eyeD, eyeR, mLong, mDown); 

}


// -- drawRobot method:
void drawRobot (float x, float y, float headWide, float headHigh,
    float eyeDist, float eyeRad, float mouthLong, float mouthDown) {
  
  // -- draw the head:
  noStroke();
  fill(220);
  rect(x,y,headWide,headHigh);

  // -- draw the eyes:
  fill(32);
  circle(x-eyeDist/2, y, eyeRad);
  circle(x+eyeDist/2, y, eyeRad);

  // -- draw the mouth:
  stroke(32);
  strokeWeight(3);
  line(x-mouthLong/2, y+mouthDown, x+mouthLong/2, y+mouthDown);
}
