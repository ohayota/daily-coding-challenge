class Anchor {
  
  CenterPoint p;
  
  Anchor(CenterPoint p) {
    this.p = p;
  }
  
  CenterPoint calcCP() {
    noiseSeed(1);
    float noiseX = map(noise(offset), 0, 1, -200, 200);
    noiseSeed(2);
    float noiseY = map(noise(offset), 0, 1, -200, 200);
    return (new CenterPoint(p.x+noiseX, p.y+noiseY));
  }
  
  void draw() {
    noiseSeed(3);
    float size = 100 + map(noise(offset), 0, 1, -150, 150);
    CenterPoint cp = calcCP();
    ellipse(cp.x, cp.y, size, size);
  }
  
}
