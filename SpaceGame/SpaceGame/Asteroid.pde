class Asteroid {
  // Member Variables
  int x, y, r, liv;
  float speed, dir;
  color c1, c2, c3;
  boolean alive, pu;

  // Constructor
  Asteroid(int x, int y, int r, boolean pu) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.pu = pu;
    speed = random(8,10);
    dir = 0;
    alive = true;
  }
void move() {
 x+=speed;
}

boolean reachedRight () {
if (x>width + r*4) {
      return true;
    } else {
      return false;
    }
  }


  // Display Method
  void display() {
    if (!pu){
    fill(250);
    triangle(x,y,x-random(20),y-10,x-random(20),y+10);
    } else {
    fill(250,250,0);
    triangle(x,y,x-random(20),y-10,x-random(20),y+10);
    }
  }

  // Behavior Methods
 
}
