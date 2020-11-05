ArrayList<Sun> suns = new ArrayList<Sun>();

int r = 0;

void setup() {
  size(900, 900);
  ellipseMode(CENTER);
  
  for (int y = 0; y <= height; y += 45) {
    for (int x = 0; x <= width; x += 45) {
      suns.add(new Sun(x, y));
    }
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < suns.size(); i++) suns.get(i).draw();
  
  r += 5;
}

class Sun {
  int x;
  int y;
  
  Sun(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    pushMatrix();
    translate(this.x, this.y);
  
    rotate(radians(r));
  
    fill(255);
    ellipse(-1.01, -1.01, 59.5-1*sin(r), 59.5-1*sin(r*1.9));
    fill(0);
    ellipse(0, 0, 60, 60);
    popMatrix();
  }
  
}
