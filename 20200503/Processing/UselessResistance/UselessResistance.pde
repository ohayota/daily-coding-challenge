float offset = 0.0;
float distance = 0.01;

void setup() {
  size(1280, 720);
  //fullScreen(); 
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
}

void draw() {
  //background(0);
  noiseSeed(31);
  drawNoise();
  noiseSeed(34);
  drawNoise();
  noiseSeed(37);
  drawNoise();
  noiseSeed(41);
  drawNoise();
  noiseSeed(48);
  drawNoise();
  offset += 0.01;
}

void keyPressed() {
  //if (key == ENTER) saveFrame("output.png");
}

void drawNoise() {
  stroke(map(noise(offset), 0.4, 1.0, 60, 300), 100, 100, 5);
  strokeWeight(5);
  float x = offset*100;
  float x_next = (offset+distance)*100;
  float y1 = map(noise(offset), 0, 1, -100, height+100);
  float y2 = map(noise(offset), 0, 1, height+100, -100);
  float y1_next = map(noise(offset+distance), 0, 1, -100, height+100);
  float y2_next = map(noise(offset+distance), 0, 1, height+100, -100);
  line(x, y1, x, y2);
  line(x, y1, x_next, y1_next);
  line(x, y2, x_next, y2_next);
}
