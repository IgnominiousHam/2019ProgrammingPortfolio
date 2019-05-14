//Spencer Hamilton
//Screensaver App

float xpos;
float ypos;
float strokeW;
float lineLength;
Lines[] myLines = new Lines[5000];

void setup() { //<>//
  frameRate (100);
  size(displayWidth, displayHeight);
  background(0);
  for (int i=0; i<myLines.length; i++) {
    myLines [i] = new Lines(random(width), random(height), random(2, 50), random(2, 100));
  }
}

void draw() {
  for (int i=0; i<myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  }
}
