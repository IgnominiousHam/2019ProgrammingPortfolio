class Lines {
  //Member Variables
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;

  //Constructor
  Lines(float xpos, float ypos, float strokeW, float lineLength) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.strokeW = strokeW;
    this.lineLength = lineLength;
  }

  void display () {
    strokeW = random(1,5);
    lineLength = random(1, 50);
    stroke(random(50, 250), random(50, 250), random(50, 250));
    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (random(100)>90) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength);
      } else if (random (100) >80) {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      } else if (random (100) > 70) {
        strokeWeight(strokeW);
        moveRU(xpos, ypos, lineLength);
      } else if (random (100) > 60) {
        strokeWeight(strokeW);
        moveRD(xpos, ypos, lineLength);
      } else if (random (100) > 50) {
        strokeWeight (strokeW);
        moveLU(xpos, ypos, lineLength);
      } else if (random (100) >40) {
        strokeWeight (strokeW);
        moveLD(xpos, ypos, lineLength);
      } else if (random(100) >30) {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      } else if (random(100) >20) {
        strokeWeight(strokeW);
        moveDown(xpos,ypos, lineLength);
      }
    }
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX + i;
  }
}
void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX-i;
  }
}
void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    ypos = startY-i;
  }
}
void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    ypos = startY+i;
  }
}
void moveLU(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY-i);
    xpos = startX-i;
    ypos = startY - i;
  }
}

void moveRU(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY-i);
    xpos = startX+i;
    ypos = startY - i;
  }
}

void moveLD(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY+i);
    xpos = startX-i;
    ypos = startY+i;
  }
}

void moveRD(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY+i);
    xpos = startX+i;
    ypos = startY + i;
  }
}
