// Global variables for the circle
float circleX, circleY;     // Circle's position
float circleDiameter;       // Circle's diameter
boolean isMouseOver;        // To check if the mouse is over the circle

void setup() {
  size(800, 800);          // Set the canvas size
  resetCircle();           // Initialize the circle with random position and size
  noStroke();              // No border for the circle initially
}

void draw() {
  background(255);         // Clear the screen with white background

  // Check if the mouse is inside the circle
  isMouseOver = dist(mouseX, mouseY, circleX, circleY) < circleDiameter / 2;
  
  // Change the circle's appearance if the mouse is over it
  if (isMouseOver) {
    fill(255, 0, 0);       // Highlight the circle in red
    stroke(0);             // Add a black stroke to the circle
    strokeWeight(3);       // Make the stroke thicker
  } else {
    fill(0, 150, 255);     // Default color when mouse is not over the circle
    noStroke();            // No border
  }

  // Draw the circle
  ellipse(circleX, circleY, circleDiameter, circleDiameter);
}

void mousePressed() {
  // Check if the mouse click was inside the circle
  if (isMouseOver) {
    resetCircle();         // If so, reset the circle's position and size
  }
}

void resetCircle() {
  // Set the circle to a random position within the canvas
  circleX = random(circleDiameter / 2, width - circleDiameter / 2);
  circleY = random(circleDiameter / 2, height - circleDiameter / 2);
  
  // Set the circle to a random size between 30 and 100 pixels
  circleDiameter = random(30, 100);
}
