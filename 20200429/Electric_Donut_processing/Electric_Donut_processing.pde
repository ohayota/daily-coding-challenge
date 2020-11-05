float offset = 0.0;
boolean isNoise = true;

void setup() {
  size(900, 900);
  background(0);
  noStroke();
  fill(#00B7CC, 10);
}

void draw() {
  // ここをコメントアウトすると激しく動かなくなる
  //offset = 0.0;
  //randomSeed(1);
  //noiseSeed(1);
  
  //background(0);
  translate(width/2, height/2);
  //for (int i = 0; i < 360; i++) {
  //  rotate(PI/180);
  //  if (isNoise) {
  //    ellipse(0, -width/4 + noise(offset)*mouseX/2-mouseX/4, 10, 10);
  //  } else {
  //    ellipse(0, -width/4 + random(-mouseX/4, mouseX/4), 10, 10);
  //  }
  //  offset += 0.01;
  //}
  for (int i = 0; i < 360; i++) {
    rotate(PI/180);
    if (isNoise) {
      fill(#00B7CC, 5);
    } else {
      fill(#CCCCCC, 5);
    }
    offset += 0.01;
    ellipse(0, -width/4 + noise(offset)*mouseX/2-mouseX/4, 10, 10);
  }
}

void mouseClicked() {
  isNoise = !isNoise;
}

void keyPressed() {
  //saveFrame("output.png");
}
