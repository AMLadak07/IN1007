float x;
float y;

void setup() {
  size(200, 300);
  x = random(65, width - 65);  // Ensures that the rectangle fits inside the window
  y = random(50, height - 50); // Ensures the circle is fully visible

}

void draw() {
  background(150);  // Set gray background

  // Draw the circle first
  if (dist(mouseX, mouseY, x, y) < 50) {
    fill(255, 0, 0);  // Red if the mouse is inside the circle
  } else {
    fill(255);  // White if the mouse is outside the circle
  }
  ellipse(x, y, 100, 100);  // Draw the circle (Diameter of 100)

  // Now, draw the rectangle on top of the circle
  if (mouseX > x - 65 && mouseX < x + 65 && mouseY > y - 10 && mouseY < y + 10) {
    fill(0, 0, 255);  // Blue if the mouse is inside the rectangle
  } else {
    fill(255);  // White otherwise
  }
  rectMode(CENTER);  // Center the rectangle at (x, y)
  rect(x, y, 130, 20);  // Draw the rectangle (Width = 130, Height = 20)
}
