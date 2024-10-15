// Color variables
color circle1Color = color(255, 0, 0); // Red
color circle2Color = color(0, 255, 0); // Green
color circle3Color = color(0, 0, 255); // Blue
color circle4Color = color(255, 255, 0); // Yellow


//Circle 1 variables
float x1, y1;
float xSpeed1 = 1; //Speed in x direction
float ySpeed1 = 1; //Speed in y direction

//Circle 2 variables
float x2, y2;
float xSpeed2 = -1; //Moving in opposite direction on x-axis
float ySpeed2 = 1; //Moving towards bottom-left

//Circle 3 variables
float x3, y3;
float xSpeed3 = 1;
float ySpeed3 = -1; //Moving towards top-right

//Circle 4 variables
float x4, y4;
float xSpeed4 = -1;
float ySpeed4 = -1; //Moving towards top-left

void setup() {
  size(400, 400);
  //All circles start in the centre
  x1 = width/2;
  y1 = height/2;

  x2 = width/2;
  y2 = height/2;

  x3 = width/2;
  y3 = height/2;

  x4 = width/2;
  y4 = height/2;
}

void draw() {
  //Clear background
  background(255);

  //Update positions for all circles
  x1 = x1 + xSpeed1;
  y1 = y1 + ySpeed1;

  x2 = x2 + xSpeed2;
  y2 = y2 + ySpeed2;

  x3 = x3 + xSpeed3;
  y3 = y3 + ySpeed3;

  x4 = x4 + xSpeed4;
  y4 = y4 + ySpeed4;

  //Draw Circles at updated coordinates
  fill(circle1Color);
  ellipse(x1, y1, 60, 60); //Red Circle

  fill(circle2Color);
  ellipse(x2, y2, 60, 60); //Green Circle

  fill(circle3Color);
  ellipse(x3, y3, 60, 60); //Blue Circle

  fill(circle4Color);
  ellipse(x4, y4, 60, 60); //Yellow Circle
}
