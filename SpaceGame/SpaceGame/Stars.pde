class Stars {
  int x, y;
  float speed;

  Stars(int x, int y) {
    this.x = x;
    this.y = y;
    speed = random(3,5);
  }

  void move() {
    x+=speed;
  }

boolean reachedRight () {
if (x>width) {
      return true;
    } else {
      return false;
    }
  }


  void display() {
    fill(250,23,23);
    ellipse(x,y,3,3);

  }
}
