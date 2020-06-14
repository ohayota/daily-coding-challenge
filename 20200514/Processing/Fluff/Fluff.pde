float offset;
ArrayList<Anchor> anchor;

void setup() {
  size(900, 900, P2D);
  //fullScreen(P2D);
  frameRate(60);
  noFill();
  strokeWeight(2);
  ellipseMode(CENTER);
  background(0);
  
  offset = 0.0;
  anchor = new ArrayList<Anchor>();
  for (int i = 0; i < 32; i++) {
    anchor.add(new Anchor(new CenterPoint(0, -200)));
  }
}

void draw() {
  // Background
  fill(0, 1);
  noStroke();
  //rect(0, 0, width, height);
  
  stroke(#EEEEEE, 10);
  fill(0, 10);
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount/(TWO_PI*32));
  for (int i = 0; i < anchor.size(); i++) {
    rotate(TWO_PI/anchor.size());
    anchor.get(i).draw();
  }
  for (int i = 0; i < anchor.size(); i++) {
    rotate(TWO_PI/anchor.size());
    line(anchor.get(i).calcCP().x,
         anchor.get(i).calcCP().y,
         (anchor.get(i).calcCP().x + 280) + anchor.get(i).calcCP().x * -sin(TWO_PI/anchor.size()),
         (anchor.get(i).calcCP().y + 280) + anchor.get(i).calcCP().y * -cos(TWO_PI/anchor.size()));
  }
  popMatrix();
  
  offset += 0.01;
}

void keyPressed() {
  if (key == 'f') {
    filter(BLUR, 1);
  }
  if (key == 's') {
    saveFrame("####.png");
  }
}
