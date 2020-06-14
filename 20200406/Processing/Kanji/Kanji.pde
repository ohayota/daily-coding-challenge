import geomerative.*;

RFont font;
String type = "溶";

int b = 255;

void setup() {
  size(900, 900);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  RG.init(this);
  font = new RFont("ShipporiMincho-TTF-Regular.ttf", 600, RFont.LEFT);
  
  RCommand.setSegmentLength(3);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  
  background(0);
}

void draw() {
  fill(0, 20);
  rect(0, 0, width*2, height*2);
  
  translate(width/2-300, height/2+220);
  
  if (type.length() > 0) {
    RGroup grp;
    grp = font.toGroup(type);
    grp = grp.toPolygonGroup();
    RPoint[] pnts = grp.getPoints();
  
    fill(b, 15);
    noStroke();
    for (int i = 0; i < pnts.length; i++) {
      float diameter = 15+(255-b)*0.3;
      ellipse(pnts[i].x, pnts[i].y, diameter, diameter);
    }
    if (b > 0) b -= 2.5;
  }
}
