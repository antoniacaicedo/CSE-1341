//Antonia Caicedo
//Final Project
int numCircles = 8;
Agent[] agents = new Agent[numCircles];

void setup() {
  size(800, 800);
  //frameRate(15); // uncomment to slow down
 

for (int i=0; i<numCircles; i++) {
agents[i] = new Agent();
agents[i].setLocation(width/2, height/2);
      }
    }
    // background(0);
    void draw() {
       background(0);
  PImage backImg = loadImage("walls.jpg");
  color x = get(5, 5);
  for (int i = 0; i< 10; i++) {
    for (int j = 0; j< 10; j++) {
      backImg.set(i, j, x);
    }
    backImg.loadPixels();
    image(backImg, 0, 0);
  }
  PImage winImg = loadImage("window.back.jpg");
  color y = get(5, 5);
  for (int i = 0; i< 10; i++) {
    for (int j = 0; j< 10; j++) {
      winImg.set(i, j, y);
    }
    winImg.loadPixels();
    image(winImg, 60, 60,680,600);
  }
  
      strokeWeight(7);
//window
      stroke(255, 255, 255);
      rect (60, 60, 680, 600);
      line (60, 370, 740, 370);
      line (400, 60, 400, 740);//kitty
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
      /*beginShape();
       vertex(300, 590);
       vertex(281, 640);
       vertex(300, 710);
       vertex(319, 640);
       endShape();
       beginShape();
       vertex(500, 590);
       vertex(519, 640);
       vertex(500, 710);
       vertex(481, 640);
       endShape();*/
      //whiskers
      strokeWeight(1.5);
      stroke(255, 255, 255);

      line(400, 760, 210, 775);
      line(400, 760, 590, 775);
      line(400, 760, 250, 748);
      line(400, 760, 550, 748);


      fill(0, 30);
      rect(-5, -5, width+5, height+5);
      //background(0); // uncomment to turn off trails
      for (int i=0; i<agents.length; i++) {
        agents[i].drawShape();
        agents[i].update();
        agents[i].moveFish();


        //table
        fill(82, 38, 38);
        noStroke();
        rect(350, 750, 100, 100);
        fill(82, 38, 38);
        noStroke();
        rect(50, 650, 700, 100);



        //bowl shape
        fill (173, 247, 255, 40);
        arc(400, 275, 750, 750, -QUARTER_PI, PI+QUARTER_PI, OPEN);
        rect(80, 0, 640, 12);
      }
    }