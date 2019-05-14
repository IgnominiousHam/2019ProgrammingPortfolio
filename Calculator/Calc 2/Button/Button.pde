class Button {
  // Member Variables
  int x, y, w, h, v;
  String op;
  color c;
  boolean hover, num, dec, rect;

  // Multiple Constructors
  Button(int x, int y, int w, int h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    hover = false;
  }
  Button asNumber(int v) {
    this.v = v;
    num = true;
    dec = false;
    rect = false;
    return this;
  }


  Button asOperator(String op) {
    this.op= op;
    num = false;
    dec = false;
    rect = false;
    return this;
  }

  Button asDecimal(String op) {
    this.op= op;
    num = false;
    dec = true;
    rect = false;
    return this;
  }

  Button asRect(String op) {
    this.op= op;
    num=false;
    dec=false;
    rect = true;
    return this;
  }

  // Display Method
  void display () {
    if (dec ==false) {
      if (rect == false) {
        if (num == true) {
          rectMode(CENTER);
          if (hover) {
            fill(250);
          } else {
            fill(c);
          }
          ellipse (x, y, w, h);
          textAlign(CENTER, CENTER);
          fill(0);
          text (v, x, y);
        } else {
          rectMode(CENTER);
          if (hover) {
            fill(250);
          } else {
            fill(c);
          }
          rect (x, y, w, h, 10);
          textAlign(CENTER, CENTER);
          fill(0);
          text (op, x, y);
        }
      } else if (rect == true) {
        rectMode(CENTER);
        if (hover) {
            fill(250);
          } else {
            fill(c);
          }
        rect (x, y, w, h);
        textAlign(CENTER, CENTER);
        fill(0);
        text (op, x, y);
      }
    } else if (dec == true) {
      rectMode(CENTER);
      if (hover) {
            fill(250);
          } else {
            fill(c);
          }
      ellipse (x, y, w, h);
      textAlign(CENTER, CENTER);
      fill(0);
      text (op, x, y);
    }
  }
  //Hover Method
  void hover() {
    hover = mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
  }
}
