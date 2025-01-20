float x;  // Global variable for the x position of the square
float y;  // Global variable for the y position of the square

void setup() {
  size(400, 400); // Set the size of the window
  x = width / 2 - 30;  // Initialize x to center the square
  y = height / 2 - 30; // Initialize y to center the square
}

void draw() {
  background(255); // Clear the background each frame
  rect(x, y, 60, 60);  // Draw the square at (x, y) with size 60x60
}

void keyPressed() {
  // Move the square up when 'w' is pressed
  if (key == 'w') {
    y -= 1;
  }
  // Move the square down when 's' is pressed
  if (key == 's') {
    y += 1;
  }
  // Move the square left when 'a' is pressed
  if (key == 'a') {
    x -= 1;
  }
  // Move the square right when 'd' is pressed
  if (key == 'd') {
    x += 1;
  }
}
