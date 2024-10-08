int squareSize = 40;  // Size of each square
int numSquares = 9;   // Number of squares

void setup() {
  size(400, 400);  // Set canvas size
  noStroke();      // Remove borders for squares
}

void draw() {
  background(255);  // Clear the canvas
  for (int i = 0; i < numSquares; i++) {
    // Introduce randomness in the position of squares
    float xOffset = random(-5, 5);
    float yOffset = random(-5, 5);
    
    // Calculate position of each square
    float x = 50 + i * (squareSize + 10) + xOffset;
    float y = 100 + yOffset;

    // Check if the mouse is within the current square's boundaries
    if (mouseX > x && mouseX < x + squareSize && mouseY > y && mouseY < y + squareSize) {
      fill(255, 128, 32);  // Color the square under the mouse pointer
    } else {
      fill(200);  // Default color for other squares
    }
    
    rect(x, y, squareSize, squareSize);  // Draw the square
  }
}
