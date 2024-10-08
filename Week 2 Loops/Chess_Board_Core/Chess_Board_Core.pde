int squareSize = 50;  // Size of each square
int numSquares = 8;   // Number of squares in each row and column

void setup() {
  size(400, 400);  // Set canvas size
  noStroke();      // Remove borders for squares
}

void draw() {
  background(255);  // Clear the canvas
  for (int row = 0; row < numSquares; row++) {
    for (int col = 0; col < numSquares; col++) {
      // Check if the sum of the row and column indices is even or odd to alternate colors
      if ((row + col) % 2 == 0) {
        fill(255);  // White square
      } else {
        fill(0);    // Black square
      }
      
      // Draw each square
      rect(col * squareSize, row * squareSize, squareSize, squareSize);
    }
  }
}
