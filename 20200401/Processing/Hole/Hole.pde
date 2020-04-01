ArrayList<LightCircle> circles;

void setup() {
  size(900, 900);
  noStroke();
  noCursor();
  ellipseMode(CENTER);
  colorMode(HSB);
  
  background(0);
  
  // 描画用の円を生成
  circles = new ArrayList<LightCircle>();
  circles.add(new LightCircle(0, 900.0, 0)); // 朱
  circles.add(new LightCircle(30, 900.0, 150)); // 金
  circles.add(new LightCircle(60, 900.0, 300)); // 黄緑
  circles.add(new LightCircle(90, 900.0, 450)); // 緑
  circles.add(new LightCircle(120, 900.0, 600)); // 水色
  circles.add(new LightCircle(150, 900.0, 750)); // 青
}

void draw() {
  // 半透明の黒
  fill(0, 5);
  rect(0, 0, width, height);
  
  // 中心を基準にして描画
  pushMatrix();
  translate(width/2, height/2);
  for (LightCircle c: circles) c.draw();
  popMatrix();
}
