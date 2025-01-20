// -- Very Basic Robot class that accepts arguments ... now with eyes!
// -- OK - we are getting somewhere!

class Robo {
  
  float x,y;
  
  Robo (float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    // -- draw the head:
    fill(200);
    strokeWeight(1);
    rect(x,y,30,20);

    // -- draw the eyes:
    fill(32);
    circle(x-6,y-2,4);
    circle(x+6,y-2,4);

    // -- draw the mouth:
    line(x-10,y+6, x+10, y+6);
  }
  
}
