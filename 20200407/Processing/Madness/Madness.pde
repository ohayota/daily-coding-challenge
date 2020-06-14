void setup() {
  size(900, 900, P3D);
  background(0);
  
  noStroke();
  translate(width/2, height/2, 0);
  
  for (int i = 0; i < 900; i++) {
    fill(150, 30, 30, 10);
    for (int a = 0; a < 900; a += 10) {
      ellipse(i-a, i*sin(radians(i))*cos(radians(i)), 10, 10);
      ellipse(i-a, i*sin(radians(i+40)), 10, 10);
      ellipse(i-a, i*sin(radians(i+80)), 10, 10);
      ellipse(i-a, i*sin(radians(i+120)), 10, 10);
      ellipse(i-a, i*sin(radians(i+160)), 10, 10);
    }
  }
  
  //fill(255);
  //directionalLight(255, 255, 255, 0, -100, -100);
  //directionalLight(255, 255, 255, 100, 0, 0);
  //directionalLight(255, 255, 255, 100, 100, 0);
  //directionalLight(255, 255, 255, 100, 100, 100);
  //directionalLight(200, 50, 50, -100, 0, 0);
  //sphere(200);
  
  saveFrame("frames/20200407.jpg");
}
