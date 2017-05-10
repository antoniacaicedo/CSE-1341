//Antonia Caicedo
//Final Project
/* I am here-by accrediting Donya Quick's lecture examples:
doodle_bug_demo1.zip
and doodle_bug_demo4.zip
FOR MOVEMENT DEMO'S W OBJECT AND PICTURES, MODIFIED FOR MY FISHBOWL
as well as the images used from 
http://www.clker.com/clipart-coral-.html 
for the clip art.
All other work is original and learned in class and through tutors in the ALEC.
*/
PImage backImg;
PImage winImg;
PImage imgC;
PImage imgL;
boolean pebbles;
int numFish = 8;
int nSeaweed = 100; 
int numCircles = 6;
float[] xs = new float[numCircles];
float[] ys = new float[numCircles];
Fish[] myFish = new Fish[numFish];
Seaweeds[] seaweed = new Seaweeds[nSeaweed];

void setup() {
  size(800, 800);
  frameRate(8);
  background(0);

  for (int i=0; i<myFish.length; i++) {
    myFish[i] = new Fish();
    myFish[i].setLocation(width/2, height/2);
  }
   for (int i=0; i<numCircles; i = i+1) {
    xs[i] = 0;
    ys[i] = 0;
  }


// images 1 and 2
//and seaweeds
   backImg = loadImage("walls.jpg");
   winImg = loadImage("window.back.jpg");
   imgC = loadImage("coral.png");
   imgL = loadImage("pinkcoral.png");
}
    void draw() {
      for (int i=0; i<myFish.length; i++) {
        myFish[i].drawFish();
        myFish[i].update();
      }
       
    image(backImg, 0, 0);
    image(winImg,60,60,680,600);

      strokeWeight(7);
      //window
      noFill();
      stroke(255, 255, 255);
      rect (60, 60, 680, 600);
      line (60, 370, 740, 370);
      line (400, 60, 400, 740);
      //kitty
      noStroke();
      fill(#868988);
      ellipse(400, 700, 550, 550);
      //ears
      triangle(150, 600, 175, 400, 300, 550);
      triangle(650, 600, 625, 400, 500, 550);
      //eyes
      fill(#DFFA6A);
      strokeWeight(0);
      arc(290, 650, 130, 100, PI+QUARTER_PI, TWO_PI);
      arc(309, 615, 130, 100, HALF_PI-QUARTER_PI, PI);
      arc(510, 650, 130, 100, PI, TWO_PI-QUARTER_PI);
      arc(491, 615, 130, 100, 0, PI-QUARTER_PI);
      //pupils
      fill(0);
      if (mouseX >= width/2) {
        arc(329, 622, 60, 60, QUARTER_PI, PI+QUARTER_PI);
        arc(526, 620, 60, 60, QUARTER_PI, PI+QUARTER_PI);
      } else {
        arc(274, 620, 60, 60, -QUARTER_PI, PI-QUARTER_PI);
        arc(471, 622, 60, 60, -QUARTER_PI, PI-QUARTER_PI);
      }

      //ellipse(300, 650, 75, 120);
      //ellipse(500, 650, 75, 120);
      noFill();
      //whiskers
      strokeWeight(1.5);
      stroke(255, 255, 255);
    image(imgC,450,300);
    image(imgL,550,210);

      line(400, 760, 210, 775);
      line(400, 760, 590, 775);
      line(400, 760, 250, 748);
      line(400, 760, 550, 748);


      fill(0, 30);
      rect(-5, -5, width+5, height+5);
      //background(0); // uncomment to turn off trails
      for (int i=0; i<myFish.length; i++) {
        myFish[i].drawFish();
        myFish[i].update();
        myFish[i].moveFish();


        //table
        fill(82, 38, 38);
        noStroke();
        rect(350, 750, 100, 100);
        fill(82, 38, 38);
        noStroke();
        rect(50, 650, 700, 100);

    image(imgC,125,300);
     initSeaweeds();
      displayPlant();
      
        //bowl shape
        noStroke();
        fill (173, 247, 255, 40);
        arc(400, 275, 750, 750, -QUARTER_PI, PI+QUARTER_PI, OPEN);
        rect(80, 0, 640, 12);
      }
if (mousePressed ==true){      
  xs[0] = mouseX;
  ys[0] = mouseY;
  for (int i = 0; i<numCircles; i = i+1) {
    fill(95,62,29);
    ellipse(xs[i], ys[i], 7, 7);
  }
  for (int i=numCircles-1; i>0; i = i-1) {
    xs[i] = xs[i-1];
    ys[i] = ys[i-1];
    pebbles = true;
  }
   }
    }

    void initSeaweeds() {
      for(int i=0; i< nSeaweed; i++) {
        seaweed[i] = new Seaweeds();
      }
    }
    
    void displayPlant() {
    for(int i=0; i< this.nSeaweed; i++){
      this.seaweed[i].display();
      this.seaweed[i].moveSeaweed();
    }
  }
    