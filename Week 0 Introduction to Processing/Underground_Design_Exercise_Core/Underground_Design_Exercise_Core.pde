// Variables for width and height
float circleOuterDiameter = 250;
float circleInnerDiameter = 150;
float rectWidth = 300;
float rectHeight = 50;
float textSizeValue = 43;

void setup(){
  size(600, 400);
  background(255);
  noStroke();
}

void draw(){
  fill(255, 0, 0);
  // Outer circle
  circle(width / 2, height / 2, circleOuterDiameter);
  
  fill(255);
  // Inner circle
  circle(width / 2, height / 2, circleInnerDiameter);
  
  fill(4, 0, 139);
  // Rectangle
  rect((width - rectWidth) / 2, (height / 2) - rectHeight / 2, rectWidth, rectHeight);
  
  textAlign(CENTER);
  textSize(textSizeValue);
  fill(255);
  // Text
  text("UNDERGROUND", width / 2, height / 2 + rectHeight / 4);
}
