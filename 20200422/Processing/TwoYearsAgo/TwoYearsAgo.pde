int theta;
float offset = 0.0;

void setup() {
  size(900, 900);
  //ellipseMode(CENTER);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  background(30, 100, 50);
}

void draw() {
  translate(width/2, height/2);
  rotate(radians(theta));
  noiseSeed(13);
  offset += 0.01;
  noStroke();
  fill(60, 20, 100);
  for (int i = -12; i < 16; i++) {
    rect(0, 300+noise(offset)*150-25*i, 20, 20);
  }
  
  theta += 1;
  if (360 <= theta) noLoop();
}

void mouseClicked() {
  //saveFrame("output.png");
}
