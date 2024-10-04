void setup() {
  size(400, 400);
}

void draw() {
  background(192);
  roundel(width / 2, height / 2);  // Draw the shape at the center
  roundel(100, 100);  // Draw the shape at different positions
  roundel(300, 300);  
  roundel(100, 300);
}

void roundel(float x, float y) {
  // Drawing a circle
  ellipse(x, y, 100, 100);
  
  // Drawing a rectangle
  rect(x - 50, y - 25, 100, 50);
  
  // Drawing a triangle
  triangle(x, y - 60, x - 30, y + 30, x + 30, y + 30);
}
