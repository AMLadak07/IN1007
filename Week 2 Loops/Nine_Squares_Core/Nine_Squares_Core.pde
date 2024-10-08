void setup() {
  size(400, 400);  // Set canvas size
  int squareSize = 40;  // Size of each square
  for (int i = 0; i < 9; i++) {
    println("Loop iteration: " + i);  // Print loop counter
    
    // Change color for every alternate square
    if (i % 2 == 0) {
      fill(255, 0, 0);  // Red for even squares
    } else {
      fill(255);  // White for odd squares
    }
    
    // Draw rectangle, spaced apart by squareSize + 10
    rect(50 + i * (squareSize + 10), 100, squareSize, squareSize);
  }
}
