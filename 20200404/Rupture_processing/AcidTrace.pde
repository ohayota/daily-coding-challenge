class AcidTrace {
  
  float direction;
  float traceSize;
  float distance;
  float maxDistance;
  
  final float initialTraceSize;
  
  public AcidTrace(float direction, float traceSize) {
    this.direction = direction;
    this.traceSize = traceSize;
    this.initialTraceSize = traceSize;
    this.distance = 0;
    this.maxDistance = traceSize*11;
  }
  
  public boolean isOverMax() {
    return maxDistance < distance;
  }
  
  void draw() {
    pushMatrix();
    rotate(direction);
    for (int i = 0; i < 10; i++) {
      ellipse(0, distance, traceSize*((cos(radians(distance*2))+1)/4+0.5), traceSize*((cos(radians(distance*2))+1)/4+0.5));
      distance += initialTraceSize*0.2;
    }
    popMatrix();
  }
  
}
