class Smoke {
  
  float x;
  float y;
  float alpha;
  
  public Smoke(float x, float y) {
    this.x = x;
    this.y = y;
    this.alpha = 80;
  }
  
  void draw() {
    fill(0, 0, 100, alpha);
    alpha -= 4;
    noStroke();
    ellipse(x, y, 40, 40);
    x += (x-450);
    y += (y-450);
  }
  
}
