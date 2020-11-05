class Nezumihanabi {
  
  float offset;
  int seed;
  
  Nezumihanabi() {
    this.offset = 0.0;
    seed = (int)random(0, 20);
  }
  
  void draw() {
    noiseSeed(seed);
    
    pushMatrix();
    //translate(width/2, height/2);
    
    float plus = (noise(this.offset)-0.5) * 1500;
    fill(255, 0, 0, 2);
    ellipse(width/2+plus, offset*100+plus*0.3-150, 80, 80);
    fill(0, 0, 255, 2);
    ellipse(width/2+50+plus, offset*100+plus*0.3-150, 80, 80);
    fill(0, 255, 0, 2);
    ellipse(width/2-50+plus, offset*100+plus*0.3-150, 80, 80);
    fill(255, 255, 0, 2);
    ellipse(width/2+100+plus, offset*100+plus*0.3-150, 80, 80);
    
    popMatrix();
    
    this.offset += 0.01;
  }
  
}
