class SpaceShip {
  // Member Variables
  int x, y, r, liv;
  float speed, dir;
  color c1, c2, c3;
  boolean alive;


  // Constructor
  SpaceShip(int x, int y, int r) {
    this.x = x;
    this.y = y;
    this.r = r;
    liv = 500;
    speed = 5;
    dir = 0;
    alive = true;
    this.c1 = color(random(255), random(255), random(255));
  }

  // Display Method
  void display(int x, int y) {
    noStroke();
    fill(200,random(100, 200));
    triangle(x-30, y-5, x+20, y-10, x+20, y);
    triangle(x+45, y-5, x+20, y-10, x+20, y);
    triangle(x-30, y+5, x+20, y, x+20, y+10);
    triangle(x+45, y+5, x+20, y, x+20, y+10);
    fill(c1);
    quad(x, y-15, x, y+5, x+2, y-15, x+2, y+5);
    quad(x-5, y-14, x-5, y+4, x-3, y-14, x-3, y+4);
    quad(x, y-5, x, y+15, x+2, y-5, x+2, y+15);
    quad(x-5, y-4, x-5, y+14, x-3, y-4, x-3, y+14);
    quad(x+5, random(height), x+5, random(height), x+7, random(height), x+7, random(height));
    quad(x+7, random(height), x+7, random(height), x+9, random(height), x+9, random(height));
    quad(x+9, random(height), x+9, random(height), x+11, random(height), x+11, random(height));
    quad(x+11, random(height), x+11, random(height), x+13, random(height), x+13, random(height));
    quad(x+13, random(height), x+13, random(height), x+15, random(height), x+15, random(height));
    quad(x+15, random(height), x+15, random(height), x+17, random(height), x+17, random(height));
    quad(x+17, random(height), x+17, random(height), x+19, random(height), x+19, random(height));
  }

  // Behavior Methods
  void fire () {
  }
  void thrust() {
  }
}
