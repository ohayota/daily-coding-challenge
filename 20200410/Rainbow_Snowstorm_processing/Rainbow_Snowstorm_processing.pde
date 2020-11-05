ArrayList<Block> blocks;

void setup() {
  
  size(900, 900);
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
  strokeWeight(5);
  strokeCap(SQUARE);
  
  blocks = new ArrayList<Block>();
  
  for (int y = 0; y < height; y += 90) {
    
    blocks.add(new Block((int)(y*300/height), y, y%180==0));
  }
  
}

void draw() {
  
  for (Block b: blocks) b.draw();
  
  //saveFrame("frames/####.jpg");
  
}

class Block {
  
  boolean isLeft;
  
  int hue;
  int r;
  int y;
  float x;
  int startFrame;
  int shapeNum; // 0=ellipse, 1=rect, 2=triangle, 3=line
  
  ArrayList<PVector> shapeLoc;
  
  Block(int hue, int y, boolean isLeft) {
    this.hue = hue;
    this.r = 0;
    this.y = y;
    this.x = 0;
    this.isLeft = isLeft;
    this.startFrame = y/9;
    this.shapeNum = (int)(random(0, 4));
    
    this.shapeLoc = new ArrayList<PVector>();
    for (int i = 0; i < 50; i++) {
      if (isLeft) {
        shapeLoc.add(new PVector((int)random(45)*20, (int)random(40)*2));
      } else {
        shapeLoc.add(new PVector(width-(int)random(45)*20, (int)random(45)*2));
      }
    }
  }
  
  void drawShape() {
    
    for (PVector sl: shapeLoc) {
      pushMatrix();
      rotate(radians(x));
      translate(sl.x, sl.y);
      switch (shapeNum) {
        case 0:
        fill(hue, 100, 100);
        ellipse(sl.x+x, sl.y+y, 10, 10);
        break;
        case 1:
        fill(hue, 100, 100);
        rect(sl.x+x, sl.y+y, 10, 10);
        break;
        case 2:
        fill(hue, 100, 100);
        triangle(sl.x+x, sl.y+y, sl.x+(x-7), sl.y+(y+10), sl.x+(x+7), sl.y+(y+10));
        break;
        case 3:
        stroke(hue, 100, 100);
        line(sl.x+x, sl.y+y, sl.x+(x+10), sl.y+(y+10));
        break;
      }
      popMatrix();
    }
    
  }
  
  
  
  void draw() {
    
    if (isLeft) {
      x = -width+width*(1.0-cos(radians(r)));
    } else {
      x = width-width*(1.0-cos(radians(r)));
    }
    
    if (startFrame < frameCount) { 
      fill(hue, 100, 30, 10);
      if (isLeft) {
        rect(x, y, width, 90);
      } else {
        rect(x, y, width, 90);
      }
        
      if (r < 180) { 
        r += 4;
        drawShape();
        noStroke();
      }
    }
    
  }
    
}
