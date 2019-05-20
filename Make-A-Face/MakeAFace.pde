void setup() {
  size(500, 500);
  frameRate(1);
}

void draw() {
  background(255);
  strokeWeight(random(6,10));
  drawHead();
  drawNose();
  drawMouth();
  drawEyes();
  drawFreckles();

}

void mouseClicked() {
  saveFrame("line-######.png");
}

void drawHead() {
  fill(255,random(100,140), random (80,200));
  ellipse(width/2, height/2, random(width*0.55, width*0.75), random(height*0.8,height*0.99));
}

void drawNose(){
  bezier(width/2, height/2, random(width*0.55, width*0.65), random(height*0.55, height*0.75), random(width*0.55, width*0.65), 
  random(height*0.55, height*0.75), random(width*0.55, width*0.65), random(height*0.55, height*0.75));
}

void drawMouth(){
  line(random(width/2-90, width/2-75), random(height/2+120, height/2+150), (width/2) + 80, (height/2)+150);
}

void drawEyes(){
  ellipse(width/2-50, height/2-60, random(width*0.20, width*0.30), random(height*0.20,height*0.30));
  ellipse(width/2+50, height/2-60, random(width*0.20, width*0.30), random(height*0.20,height*0.30));
  fill(0,random(200,255),random(200,255));
  ellipse(width/2-50, height/2-60, 30, 30);
  fill(200,random(200,255),random(200,255));
  ellipse(width/2+50, height/2-60, 30,30);
}

void drawFreckles(){
  point(random(width/2-50, width/2-70), random(height/2+50, height/2+75));
  point(random(width/2-70, width/2-130), random(height/2+50, height/2+75));
  point(random(width/2-80, width/2-130), random(height/2+75, height/2+100));
  point(random(width/2-40, width/2-130), random(height/2+75, height/2+100));
  point(random(width/2+80, width/2+70), random(height/2+50, height/2+75));
  point(random(width/2+70, width/2+130), random(height/2+50, height/2+75));
  point(random(width/2+80, width/2+130), random(height/2+75, height/2+100));
  point(random(width/2+75, width/2+130), random(height/2+75, height/2+100));
}
