// 液体が飛び散る様子を描いてみる

int y;
float waterSize = 100;

boolean isDrop = true;

ArrayList<AcidTrace> traces;

void setup() {
  size(900, 900);
  background(0);
  
  ellipseMode(CENTER);
  noStroke();
  
  traces = new ArrayList<AcidTrace>();
  
  y = 10;
}

void draw() {
  
  // 画面の中心を画面の中心に設定
  pushMatrix();
  translate(width/2, height/2);
  
  if (isDrop) {
    background(0);
    drawDrop();
  } else {
    drawSpread();
  }
  
  popMatrix();
}

void drawDrop() {
  // 中心点に酸滴を表す円を描き，落ちていく表現をするために徐々に小さくする（小さくするときの変化量は徐々に大きくする）
  fill(255, 255, 0);
  ellipse(0, 0, waterSize, waterSize);
  waterSize -= 100.00001-waterSize;
  
  if (waterSize < 10) {
    isDrop = false;
    waterSize = 50;
    ellipse(0, 0, waterSize, waterSize);
    
    int quadrant = 0; // 象限(0-3)
    for (int b = 0; b < 4; b++) {
      int r = 0;
      for (int a = 0; a < 10; a++) {
        r += (int)random(5, 15);
        float s = random(10, 40);
        traces.add(new AcidTrace(radians(r+90*quadrant), s));
      }
      r += 90-r;
      float s = random(10, 25);
      traces.add(new AcidTrace(radians(r+90*quadrant), s));
      quadrant++;
    }
  }
}

void drawSpread() {
  // 落ち切ったときに周囲へ飛び散っていく状態を描く
  // 4象限に分けて，各象限3つずつランダムに方向を決める（rotate）
  // cosのグラフみたいな太さ変化で描けば自然に見えそう？
  for (AcidTrace t: traces) t.draw();
  for (int i = traces.size()-1; 0 <= i; i--) {
    AcidTrace t = traces.get(i);
    if (t.isOverMax()) {
      traces.remove(i);
    }
  }
}
