
class Fish {
  PImage img; 
  PImage img2;
  PImage imgB;
  PImage img2B;
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  float xSpeed = 0;
  float ySpeed = 0;
  float xAccel = 0;
  float yAccel = 0;
  boolean isFirst = true;
  int counter = round (random (0, 5));
  float sBound = 2;
  float aBound = 0.2; 
  float maxAccel = 0.4; 
  float aFactor = 0.4; 
  color c;
  float fSize = 0;

  Fish() {
    img = toARGB(loadImage("img.fish.jpg"));
    imgB = toARGB(loadImage("img.fish.jpg"));
    img2 = flip(img);
    img2B = flip(imgB);
    w = img.width/2;
    h = img.height/2;    
    xSpeed = random(-sBound, sBound);
    System.out.println(xSpeed);
    ySpeed = random(-sBound, sBound);
    xAccel = random(-aBound, aBound);
    yAccel = random(-maxAccel, maxAccel);
 
  }

  void setLocation(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void drawFish() {
    fill(c);
    if (xSpeed > 0) {
      if (isFirst) {
        image(img2, x, y);
      } else {
        image(img2B, x, y);
      }
    } else {
      if (isFirst) {
        image(img, x, y);
      } else {
        image(imgB, x, y);
      }
    }
    if (counter >= 5) {
      isFirst = !isFirst;
      counter = 0;
    }
    counter++;
  }
  void moveFish() {
    if ((x >= 570) || (x <= 150)) {
      xSpeed = xSpeed * -1;
    }
    if ((y >= 475) || (y <= 0)) {
      ySpeed = ySpeed * -1;
    }
  }
  
 PImage flip(PImage orig) {
    PImage newImg = createImage(orig.width, orig.height, ARGB);
    for (int i=0; i<orig.height; i++) { // for each row... (y axis)
      for (int j=0; j<orig.width; j++) { // for each column... (x axis)
        newImg.set(orig.width-1-j, i, orig.get(j,i));
      }
    }
    return newImg;
  }  
  PImage toARGB(PImage orig) {
    PImage newImg = createImage(orig.width, orig.height, ARGB);
    for (int i=0; i<orig.pixels.length; i++) {
      newImg.pixels[i] = orig.pixels[i];
    }
    return newImg;
  }
  
  void setTransparency(color c, PImage x) {
    for (int i=0; i<x.pixels.length; i++) {
      if (x.pixels[i] == c) {
        x.pixels[i] = color(0,0);
      }
    }
  }
  void update() {
    x = cap(x + xSpeed, fSize, width-fSize);
    y = cap(y + ySpeed, fSize, height-fSize);
    xSpeed = cap(bounce(xSpeed + xAccel, x, fSize, width-fSize), -sBound, sBound);
    ySpeed = cap(bounce(ySpeed + yAccel, y, fSize, height-fSize), -sBound, sBound);
    xAccel = cap(xAccel + random(-aBound, aBound), -maxAccel, maxAccel);
    yAccel = cap(yAccel + random(-aBound, aBound), -maxAccel, maxAccel);

    if (mousePressed) {
      if (x < mouseX && xAccel < 0 || x > mouseX && xAccel > 0) {
        xAccel = xAccel - random(min(xAccel*aFactor, xAccel), max(xAccel*aFactor, xAccel));
      }
      if (y < mouseY && yAccel < 0|| y > mouseY && yAccel > 0) {
        yAccel = yAccel - random(min(yAccel*aFactor, yAccel), max(yAccel*aFactor, yAccel));
      }
    }
  }
  float bounce(float speed, float x, float lower, float upper) {
    if (x <= lower && speed < 0 || x >=upper && speed > 0) {
      return -speed;
    } else {
      return speed;
    }
  }
  float cap(float val, float lower, float upper) {
    return max(min(val, upper), lower);
  }
}