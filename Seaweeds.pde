 class Seaweeds {
  
  //attributes 
  
  float x1;
  float x2;
  float y1;
  float y2;
  color seaweedColor; 
  float spdX;
  
  //default constructor 
  Seaweeds() {
    this.x1= random(210,250);
    this.y1= random(560,600);
    this.x2= random(165,275);
    this.y2= random(300,470);
    this.spdX= .2;
    this.seaweedColor = color(random(255,255),random(75,156), random(75, 75));
  }
  
  void display() {
    strokeWeight(2);
    stroke(seaweedColor); 
    line(x1,y1,x2,y2);
  }
  
  void moveSeaweed() {
    if((x2 >= 275) || (x2 <= 165)){
      spdX = spdX * -1;
    }
    this.x2 = this.x2 + .5*spdX;
 
}
 }