//Defining variables and its type
float x;
float y;

void setup() {
  size(400, 400); //Size of canvas
  //Ensures the ellipse will initially be at the centre
  x = width/2; 
  y = height/2;
}

void draw() {
  ellipse(x, y, 60, 60);
  //This shows the circle or ellipse moving towards the top left corner
  x = x - 1;
  y = y - 1;
}
