void setup() {
  size(800, 800);          // Set the size of the canvas
  background(255);         // Set the background to white
  noStroke();              // Remove the outline of the circles
}

void draw() {
  // The fill color changes with mouseX and mouseY, with transparency (alpha) set to 100
  fill(mouseX / 3, 0, mouseY / 3, 100);
  
  // Draw the circle at the mouse position with a diameter of 30
  ellipse(mouseX, mouseY, 30, 30);
}
