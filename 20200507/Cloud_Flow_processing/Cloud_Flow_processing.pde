ArrayList<Nezumihanabi> nezumihanabi = new ArrayList<Nezumihanabi>();

void setup() {
  size(900, 900);
  
  // 足せば足すほど白くする
  //colorMode(HSB, 360, 100, 100, 100);
  //blendMode(LIGHTEST);
  ellipseMode(CENTER);
  stroke(0, 1);
  
  // 最初の一個
  nezumihanabi.add(new Nezumihanabi());
  
  // 画面の初期化
  background(0);
}

void draw() {
  //fill(255, 0.001);
  //rect(0, 0, width, height);
  
  //translate(width/2, height/2);
  //rotate(PI*frameCount/360);

  if (frameCount%180 == 0) nezumihanabi.add(new Nezumihanabi());
  
  for (Nezumihanabi n: nezumihanabi) {
    n.draw();
  }
  
  if (frameCount > 3000) {
    //filter(BLUR, 3);
    //blendMode(ADD);
    //fill(255, 30);
    //rect(0, 0, width, height);
    noLoop();
  }
}

void keyPressed() {
  //saveFrame("output.jpg");
}
