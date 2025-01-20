int red;  // Global variable for the red color component

void setup() {
  size(400, 400);  // Set the size of the canvas
  red = 128;       // Initialize the red value to 128
}

void draw() {
  background(100);           // Set the background to a gray color
  fill(red, 128, 128);        // Set the fill color with variable red, fixed green and blue
  rect(100, 100, 60, 60);     // Draw a rectangle at (100, 100) with a size of 60x60
}

void keyPressed() {
  // Increment red by 10 when 'R' is pressed
  if (key == 'R') {
    red = min(red + 10, 255); // Ensure the value stays within 0-255
  }
  
  // Decrement red by 10 when 'r' is pressed
  if (key == 'r') {
    red = max(red - 10, 0);   // Ensure the value stays within 0-255
  }
}
