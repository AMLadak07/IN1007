// -- Very Basic Robot class that holds data and has a method to draew itself.
// -- Unsatisfactory!

class Rob {
  
  float x,y;
  
  Rob () {
    x = 100;
    y = 100;
    //x = random(50,width-50);   // <-- try this!
    //y = random(50,height-50);  // <-- try this!
  }
  
  void draw() {
    fill(200);
    strokeWeight(1);
    rect(x,y,30,20);
  }
  
}
