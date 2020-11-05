ArrayList<FlightPoint> points;
int colorIndex = 0;
int[] hueArray = {0, 20, 40, 60, 120};
int wallY;
int wallRange;

void setup() {
  size(900, 900);
  noStroke();
  noCursor();
  ellipseMode(CENTER);
  colorMode(HSB);
  
  //background(50);
  
  // 描画用の点を生成
  points = new ArrayList<FlightPoint>();
  for (int i = 0; i < 17; i++) {
    points.add(new FlightPoint(hueArray[0], 50+i*50));
  }
  
  colorIndex += 1;
}

void draw() {
  // 半透明の黒
  fill(0, 10);
  rect(0, 0, width, height);
  
  for (FlightPoint p: points) p.draw();
  
  for (int i = points.size()-1; 0 <= i; i--) {
    if (width < points.get(i).nowX || height < points.get(i).nowY) points.remove(i);
  }
  
  if (frameCount%90 == 0) {
    wallY = -300 + (int)(random(900));
    wallRange = (int)(random(300, 900));
    for (int i = 0; i < 17; i++) {
      points.add(new FlightPoint(hueArray[colorIndex%5], 50+(int)(random(40))*20));
    }
    colorIndex += 1;
  }
  
  if (450 < frameCount && frameCount <= 1350) {
    saveFrame("frames/####.jpg");
  }
}
