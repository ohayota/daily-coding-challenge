int year = 1950;
int saturation = 70;

boolean is2020 = false;

ArrayList<Smoke> smokes;

PFont font;

void setup() {
  size(900, 900);
  background(0);
  strokeWeight(30);
  textAlign(CENTER, CENTER);
  ellipseMode(CENTER);
  colorMode(HSB, 360, 100, 100, 100);
  
  font = createFont("helvetica-bold", 140, true);
  textFont(font);
  
  smokes = new ArrayList<Smoke>();
}

void draw() {
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
  stroke(190, saturation, 80);
  noFill();
  ellipse(width/2, height/2, width*2/3, height*2/3);
  fill(190, saturation, 80);
  text(year, width/2, height/2);
  
  if (year <= 1952) {
    if (frameCount%60 == 0) {
        year++;
        saturation--;
    }
  } else {
    if (frameCount%2 == 0) {
      if (!is2020) {
        for (int i = 0; i < 50; i++) {
          smokes.add(new Smoke(random(-5, 5)+450, random(-5, 5)+450));
        }
        for (Smoke s: smokes) s.draw();
        year++;
        if (year == 2020) is2020 = true;
        saturation--;
      }
    }
  }
  
  if (!smokes.isEmpty()) {
    for (int i = smokes.size()-1; i <= 0; i++) {
      if (smokes.get(i).alpha < 0) smokes.remove(i);
    }
  }
}
