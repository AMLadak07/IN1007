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
  background(255); // Clear the background to avoid trails
  
  // Dynamic circle diameters based on mouse position
  float dynamicOuterDiameter = circleOuterDiameter + (mouseX - width / 2) * 0.5;
  float dynamicInnerDiameter = circleInnerDiameter + (mouseY - height / 2) * 0.5;
  
  // Dynamic rectangle size
  float dynamicRectWidth = rectWidth + (mouseX - width / 2) * 0.2;
  float dynamicRectHeight = rectHeight + (mouseY - height / 2) * 0.2;

  // Outer circle (changes size with mouseX)
  fill(255, 0, 0);
  circle(width / 2, height / 2, dynamicOuterDiameter);
  
  // Inner circle (changes size with mouseY)
  fill(255);
  circle(width / 2, height / 2, dynamicInnerDiameter);
  
  // Rectangle follows the mouse and changes size
  fill(4, 0, 139);
  rect(mouseX - dynamicRectWidth / 2, mouseY - dynamicRectHeight / 2, dynamicRectWidth, dynamicRectHeight);
  
  // Text follows the mouse
  textAlign(CENTER);
  textSize(textSizeValue + (mouseX - width / 2) * 0.05); // Text size adjusts slightly with mouseX
  fill(255);
  text("UNDERGROUND", mouseX, mouseY + dynamicRectHeight / 4);
}
