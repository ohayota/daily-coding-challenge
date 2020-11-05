class FlightPoint {
  
  int hue; // 色相
  int saturation; // 彩度
  float y; // 開始時の高さ
  float nowX;
  float nowY;
  
  boolean effectFlag;
  float effectY;
  float effectSize;
  
  boolean reflectFlag;
  float acceleration;
  
  public FlightPoint(int hue, float y) {
    this.hue = hue;
    this.y = y;
    this.nowY = y;
    this.nowX = 0.0;
    this.effectFlag = false;
    this.effectY = 0;
    this.effectSize = 7;
    this.saturation = 150;
    this.reflectFlag = false;
    this.acceleration = 0.0;
  }
  
  public void draw() {
    fill(hue, saturation, 360);
    ellipse(nowX, nowY, 12, 12);
    
    if (nowX == width/2) {
      if (wallY <= y && y <= wallY+wallRange) {
        effectFlag = true;
        reflectFlag = true;
        saturation = 0;
      }
    }
    
    if (effectFlag) {
      rect(width/2, y+effectY, effectSize, effectSize);
      rect(width/2, y-effectY, effectSize, effectSize);
      effectY += 5;
      effectSize -= 0.7;
      if (effectY > 50) {
        effectFlag = false;
        effectY = 0;
      }
    }
    
    if (reflectFlag) {
      acceleration += 9.8/60.0;
      nowX -= 5;
      nowY += acceleration;
    } else {
      nowX += 5;
    }
  }
  
}
