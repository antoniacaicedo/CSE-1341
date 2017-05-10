/* Lecture demo with arrays on Monday, Feb 20, 2017
Donya Quick */
boolean pebbles;
int numCircles = 6;
float[] xs = new float[numCircles];
float[] ys = new float[numCircles];

void setup() {
  size(800,600);
  for (int i=0; i<numCircles; i = i+1) {
    xs[i] = 0;
    ys[i] = 0;
  }
}

void draw() {
  background(255);
  if (mousePressed == true){
  xs[0] = mouseX;
  ys[0] = mouseY;
  for (int i=0; i<numCircles; i = i+1) {
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