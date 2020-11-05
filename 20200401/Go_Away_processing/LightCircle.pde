class LightCircle {
  
  int hue; // 色相
  float y; // 円の最大直径
  float outY; // 外側円の直径
  float inY; // 内側円の直径
  int startFrame; // 描画開始時のframeCount値
  
  public LightCircle(int hue, float y, int startFrame) {
    this.hue = hue;
    this.y = y;
    this.outY = y;
    this.startFrame = startFrame;
  }
  
  void draw() {
    if (frameCount < startFrame) return;
    //inY = y - outY;
    
    pushMatrix();
    rotate(radians(28)*(frameCount+startFrame));
    fill(hue, 150, 200);
    rect(0, outY, outY*0.1, outY*0.1);
    //rect(0, inY-inY*0.1, inY*0.1, inY*0.1);
    stroke(hue, 150, 360);
    noFill();
    ellipse(0, 0, outY*2, outY*2);
    //ellipse(0, 0, inY*2,  inY*2);
    noStroke();
    popMatrix();
    
    // 直径が小さくなれば変化量が少なくなる
    outY -= outY / (y/2);
    if (frameCount%y-startFrame == 0) outY = y;
  }
  
}
