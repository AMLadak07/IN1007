// -- More sophisticated Basic Robot class with multiple arguments (fields, instance variables) ... amnd methods!
// -- OK - this Robot can contain and depict data!

class Robot {

  float x, y;
  float wide, high;

  Robot (float x, float y, float wide, float high) {
    this.x = x;
    this.y = y;
    this.wide = wide;
    this.high = high;
  }

  void draw() {
    // -- draw the head:
    fill(200);
    strokeWeight(1);
    rect(x, y, wide, high);
    fill(32);
    
    // -- animation : blink?
    if (frameCount%60 <5) {
      line(x-8, y-2, x-4, y-2);
      line(x+8, y-2, x+4, y-2);
    } else {
      circle(x-6, y-2, 4);
      circle(x+6, y-2, 4);
    }

    // -- draw the mouth:
    line(x-10, y+6, x+10, y+6);
  }

  // -- move down ... very basic example!
  void move() {
    this.y=this.y+1;
    this.y=constrain(this.y,0,height-high/2-5);  // <-- stop 5px from bottom of screen
  }
}
