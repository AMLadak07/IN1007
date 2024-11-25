void setup()
        {
         size(400,400); 
        }

void draw()
        {
          background(192);
          roundel();  // <-- or whatever the method is called 
        }
        
void roundel()
        {
          // Drawing a circle
          ellipse(width / 2, height / 2, 100, 100);
          
          // Drawing a rectangle
          rect(width / 2 - 50, height / 2 - 25, 100, 50);
          
          // Drawing a triangle
          triangle(width / 2, height / 2 - 60, width / 2 - 30, height / 2 + 30, width / 2 + 30, height / 2 + 30);
        } 
