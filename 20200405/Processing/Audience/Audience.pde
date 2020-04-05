int x = 0;
float y = 0;

void setup() {
  size(1800, 1800);
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  for (int i = 0; i < 8; i++) {
    stroke(70+20*i, 40, 100, 20);
    if ((int)random(4) % 4 == 0) {
      line(x, (x/4)+y+30*(i+1)-20, x, (x/4)+y+30*(i+1)+400+20);
    } else {
      line(x, (3*x/4)+y+30*(i+1)-20, x, (3*x/4)+y+45*(i+1)+400+20);
    }
  }

  y = 100 * sin(radians(x));

  x++;
}
