class Stick {
  float x;
  float y;
  float r;
  boolean dead;
  Stick(float ex, float why) {
    x = ex;
    y = why;
    r = random(-TWO_PI, TWO_PI);
  }

  void display() {
    pushMatrix();
    translate(lx, ly);
    pushMatrix();
    translate(x, y);
    fill(153-darkness, 76-darkness, 0);
    noStroke();
    rotate(r);
    rect(0, 0, 4, 24);
    popMatrix();
    popMatrix();
    if (dist(lx+x, ly+y, 400, 400) < 40) {
      dead = true;
      sCount++;
    }
  }
}