void setup() {
  size(400, 400);
}

void draw() {
  background(192);
  roundel(width / 2, height / 2, 1.0);  // Normal size
  roundel(100, 100, 0.5);  // Half the size
  roundel(300, 300, 1.5);  // 1.5x the size
  roundel(100, 300, 0.75);  // Three-quarters the size
}

void roundel(float x, float y, float scale) {
  // Drawing a circle, scaling the diameter
  ellipse(x, y, 100 * scale, 100 * scale);
  
  // Drawing a rectangle, scaling the width and height
  rect(x - (50 * scale), y - (25 * scale), 100 * scale, 50 * scale);
  
  // Drawing a triangle, scaling the distances of the vertices
  triangle(x, y - (60 * scale), x - (30 * scale), y + (30 * scale), x + (30 * scale), y + (30 * scale));
}
