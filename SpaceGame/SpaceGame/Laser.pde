class Laser {
  // Member Variables
  int x, y, w, h;
  float speed;
  color c1;
  boolean active;

  // Constructor
  Laser(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    speed = 20;
    active = true;
    this.c1 = color(random(255),random(255),random(255));
  }

  // Display Method
  void display() {
    fill(c1);
    rectMode(CENTER);
    rect(x, y, w, h);
  }


  void fire() {
    x -= speed;
  }

  boolean reachedTop() {
    if (x<0+h) {
      return true;
    } else {
      return false;
    }
  }
}
