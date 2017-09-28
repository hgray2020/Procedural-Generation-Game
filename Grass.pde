class Grass {
  float x;
  float y;
  float r;
  boolean dead;
  Grass(float ex, float why) {
    x = ex;
    y = why;
    r = random(-TWO_PI, TWO_PI);
  }

  void display() {
    pushMatrix();
    translate(lx, ly);
    pushMatrix();
    translate(x, y);
    fill(0, 125-darkness, 0);
    noStroke();


    pushMatrix();
    translate(-10, 0);
    triangle(0, 0, -5, 10, 5, 10);
    popMatrix();

    pushMatrix();
    translate(0, 0);
    triangle(0, 0, -5, 10, 5, 10);
    popMatrix();

    pushMatrix();
    translate(10, 0);
    triangle(0, 0, -5, 10, 5, 10);
    popMatrix();


    popMatrix();
    popMatrix();
    if (dist(lx+x, ly+y, 400, 400) < 40) {
      dead = true;
      gCount++;
    }
  }
}