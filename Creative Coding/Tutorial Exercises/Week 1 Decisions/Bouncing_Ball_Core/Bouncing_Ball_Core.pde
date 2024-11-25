float radius; // The radius of the circle
float xPosition;  // -- Horizontal starting position on 'x' axis in coordinate space
float xVelocity; // -- Horizontal speed in x-direction
 
void setup()
{
  size(400,300);
  fill(255,177,8);
  textSize(48);
 
  xPosition = width/2;  // -- Initialise xPosition to centre of sketch
  xVelocity = -2; // -- Initialise speed in x-direction to -2 (moving left)
  radius = 50;
}
 
void draw()
{
  background(64);
 
  ellipse(xPosition, height / 2, radius * 2, radius * 2);
 
  xPosition = xPosition + xVelocity;  // -- Change position in x on each redraw by velocity in x
  // Following if statement allows circle to bounce when it reaches right or left edge
  if (xPosition - radius <= 0 || xPosition + radius >= width) { //  || stands for OR, used to combine 2 if statements into 1
  xVelocity = -xVelocity;
}

}
