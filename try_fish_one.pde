PImage img;

void setup() {
  size(800,800);
}
void draw() {
  background (#B5EEFC);
  PImage myImg = loadImage("img.fish.jpg");
  color x = get(5,5);
   for (int i = 0; i< 10; i++) {
    for (int j = 0; j< 10; j++) {
      myImg.set(i,j,x);
}
myImg.loadPixels();
  image(myImg, 0, 0);
}
}