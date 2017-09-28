class Rock {
  float x;
  float y;
  float r;
  boolean dead;
  Rock(float ex, float why) {
    x = ex;
    y = why;
    r = random(-TWO_PI, TWO_PI);
  }

  void display() {
    pushMatrix();
    translate(lx, ly);
    pushMatrix();
    translate(x, y);
    fill(105-darkness);
    noStroke();
    rotate(r);
    quad(-10, -5, -10, 10, 0, 15, 10, 5);
    fill(255);

    popMatrix();

    popMatrix();
    if (dist(lx+x, ly+y, 400, 400) < 40) {
      dead = true;
      rCount++;
    }
  }
}