// SpaceShip
// by Spencer Hamilton
// 2018
// TODO:
Table tResults;
TableRow t1;
ArrayList<Stars> stars;
ArrayList<Asteroid> asteroids;
ArrayList<Laser> lasers; 
import processing.sound.*;
SoundFile laser;
SoundFile ship;
//SoundFile asteroidhit;
SpaceShip s1;
SpaceShip s2;
SpaceShip s3;
SpaceShip s4;
SpaceShip s5;
SpaceShip s6;
SpaceShip s7;
boolean s4Displayed = false;
boolean s5Displayed = false;
boolean s6Displayed = false;
boolean s7Displayed = false;
Timer timer2;
Timer timer;
Timer puTimer;
Timer ticTimer;
int totalRocks = 0;
int level = 0;
int starRate = 5;
int asteroidRate = 1000;
int z=60;
boolean ticker = false;
boolean play = false;
String ticText = "";
int score = 0; // Used for user score.
int health = 500;
String name = "";
float puCalc=0;

void setup() {
  background(0);
  tResults = loadTable("results.csv", "header");
  size(1000, 1000);
  laser = new SoundFile(this, "laser.wav");
  ship = new SoundFile(this, "ship.wav");
  //asteroidhit = new SoundFile(this, "asteroidhit.wav");
  s1 = new SpaceShip(mouseX, mouseY-250, 10);
  s2 = new SpaceShip(mouseX, mouseY+250, 10);
  s3 = new SpaceShip(mouseX, mouseY, 10);
  s4 = new SpaceShip(mouseX, mouseY-125, 10);
  s5 = new SpaceShip(mouseX, mouseY+125, 10);
  s6 = new SpaceShip(mouseX, mouseY+375, 10);
  s7 = new SpaceShip(mouseX, mouseY-375, 10);
  stars = new ArrayList <Stars> ();
  lasers = new ArrayList <Laser> ();
  asteroids = new ArrayList <Asteroid> ();
  timer2 = new Timer (starRate);
  timer2.start();
  timer = new Timer (asteroidRate);
  timer.start();
  ticTimer = new Timer (2000);
  timer.start();
  play = false;
}


void draw() {
  if (!play) {
    startScreen();
  } else {
    if (frameCount % 500 == 10) {
      level++;
      ticText = "Level " +level;
      ticker();
      asteroidRate -=200;
      timer.totalTime = asteroidRate;
    }
    background(0);
    noCursor();
    s1 = new SpaceShip(900, mouseY-250, 10);
    s1.display(900, mouseY-250);
    s2 = new SpaceShip(900, mouseY+250, 10);
    s2.display(900, mouseY+250);
    s3 = new SpaceShip(900, mouseY, 10);
    s3.display(900, mouseY);
    for (int i = lasers.size()-1; i>=0; i--) {
      lasers.get(i).fire();
      lasers.get(i).display();
      if (lasers.get(i).reachedTop()) {
        lasers.remove(i);
      }
    }
    if (timer2.isFinished()) {
      stars.add(new Stars (0, int(random(height))));
      timer2.start();
    }

    if (timer.isFinished()) {
      if (random(101)>20) {
        asteroids.add(new Asteroid (-20, (int(random(height))), 30, false));
      } else {
        asteroids.add(new Asteroid (-20, (int(random(height))), 30, true));
      }
      timer.start();
    }
    for (int i = stars.size() -1; i>=0; i--) {
      Stars star = (Stars) stars.get(i);
      star.display();
      star.move();
      if (star.reachedRight()) {
        stars.remove(star);
      }
    }

    for (int i = asteroids.size()-1; i>=0; i--) {
      Asteroid asteroid = (Asteroid) asteroids.get(i);
      asteroid.move();
      asteroid.display();
      if (asteroid.reachedRight()) {
        asteroids.remove(asteroid);
      }
      //Add Collision Detection Here!
      for (int j = lasers.size()-1; j>=0; j-- ) {
        Laser l = (Laser) lasers.get(j);
        if (dist(l.x, l.y, asteroid.x, asteroid.y)<asteroid.r) {
          //asteroidhit.play();
          if (!asteroid.pu) {
            score +=5 ;
            asteroids.get(i).liv -=10;
            if (asteroid.liv < 1) {
              asteroids.remove(asteroid);
            }
          } else {
            if (puCalc < 20) {
              s4Displayed = true;
              puCalc = puCalc +21;
            } else if (puCalc <40) {
              s5Displayed = true;
              puCalc = puCalc +21;
            } else if (puCalc <60) {
              s6Displayed = true;
              puCalc = puCalc +21;
            } else if (puCalc <80) {
              s7Displayed = true;
              puCalc = puCalc +21;
            } else if (puCalc< 100) {
              z=z+10;
              puCalc = puCalc +21;
            } else if (puCalc<120 && z==100) {
              health = health+100;
            }
            asteroids.get(i).liv -=10;
            if (asteroid.liv < 1) {
              asteroids.remove(asteroid);
            }
          }
          lasers.remove(l);
        }
      }
      for (int k = 0; k< asteroids.size(); k++) {
        if (dist(asteroid.x, asteroid.y, s1.x+20, asteroid.y)<asteroid.r) {
          score -= 5;
          health -=100; 
          ship.play();
          if (health < 1) {
            gameOver();
          }
          asteroids.remove(asteroid);
        }
      }
    } 
    if (ticker) {
      if (!ticTimer.isFinished()) {
        fill(255);
        textSize(44);
        textAlign(CENTER);
        text(ticText, width/2, height/2);
      }
    }

    if (s4Displayed) {
      s4 = new SpaceShip(900, mouseY-125, 10);
      s4.display(900, mouseY-125);
    }
    if (s5Displayed) {
      s5 = new SpaceShip(900, mouseY+125, 10);
      s5.display(900, mouseY+125);
    }
    if (s6Displayed) {
      s6 = new SpaceShip(900, mouseY+375, 10);
      s6.display(900, mouseY+375);
    } 
    if (s7Displayed) {
      s7 = new SpaceShip(900, mouseY-375, 10);
      s7.display(900, mouseY-375);
    }
    updateDisplay();
  }
}
void ticker() {
  ticTimer.start();
  ticker = true;
  if (ticTimer.isFinished()) {
    ticker = false;
  }
}

void startScreen() {
  fill(250);
  textSize(18);
  tResults.sort("SCORE");
  t1 = tResults.getRow(tResults.getRowCount()-1);
  textAlign(CENTER);
  text("Click to begin.", width/2, height/2);
  text("High Score: " + t1.getString("SCORE") + " by " + t1.getString("NAME"), width/2, height/2+40);
  if (mousePressed) {
    play = true;
  }
  fill(250, 250, 0);
  text("New Name: " , width/2, height/2+70);
  textAlign(LEFT);
  text(name, width/2-30, height/2+90);
  textAlign(CENTER);
  fill(250,0,0);
  text("Your fleet has been decimated by a belligerent alien warlord.\n With no recourse, you fled into the notorious Quantum Field,\n the ravenous Charybdis of 2342 sector. \nYou must utilize all of your knavery, cunning, and skill to escape alive.\n Your weapons systems are malfunctioning, and only 3 of 7 cruisers remain. \nCollect gold to rebuild and repair your craft, and shoot asteroids \nbefore they disrupt your energy field.\n Good luck, soldier." ,width/2, height/2+120);
}

void gameOver() {
  fill(250);
  textSize(22);
  textAlign(CENTER);
  text("Game Over.", width/2, height/2);
  text("Score: " + score, width/2, height/2+30);
  text("Level " + level, width/2, height/2+60);
  TableRow newRow = tResults.addRow();
  newRow.setString("NAME", name);
  newRow.setString("SCORE", str(score));
  newRow.setString("LEVEL", str(level));
  saveTable(tResults, "data/results.csv");
  tResults.sort("SCORE");
  t1 = tResults.getRow(tResults.getRowCount()-1);
  
  noLoop();
}

void mousePressed() {
  if (play) {
    if (random(100)<z) {
      lasers.add(new Laser(s1.x, s1.y, 2, 10));
      lasers.add(new Laser(s2.x, s2.y, 2, 10));
      lasers.add(new Laser(s3.x, s3.y, 2, 10));
      if (s4Displayed) {
        lasers.add(new Laser(s4.x, s4.y, 2, 10));
      }
      if (s5Displayed) {
        lasers.add(new Laser(s5.x, s5.y, 2, 10));
      }
      if (s6Displayed) {
        lasers.add(new Laser(s6.x, s6.y, 2, 10));
      }
      if (s7Displayed) {
        lasers.add(new Laser(s7.x, s7.y, 2, 10));
      }
      laser.play();
    }
  }
}

void keyPressed() {
  if (key== ' ') {
    //lasers.add(new Laser(s1.x, s1.y, 2, 10));
    //lasers.add(new Laser(s2.x, s2.y, 2, 10));
    //lasers.add(new Laser(s3.x, s3.y, 2, 10));
  } else {
    name+=key;
    println(name);
  }
}

void updateDisplay() {
  fill(250);
  textAlign(LEFT);
  textSize(12);
  quad(0, 1000, 0, 900, 100, 900, 100, 1000);
  fill(0);
  text("Score: " + score, 10, 920);
  text("Health: " + health, 10, 940);
  text("Time: " + frameCount, 10, 960 );
  text("Gold: " + puCalc, 10, 980);
}
