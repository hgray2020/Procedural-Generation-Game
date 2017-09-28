class Torch {
  float x;
  float y;
  float r;
  boolean dead;
  Torch(float ex, float why) {
    x = ex;
    y = why;
    r = random(-TWO_PI, TWO_PI);
  }

  void display() {
    pushMatrix();
    translate(lx, ly);
    pushMatrix();
    translate(x, y);
    fill(200, 50);
    noStroke();
    ellipse(0, 0, 400, 400);
    fill(204+round(random(-10, 10)), 204+round(random(-10, 10)), 0);
    rect(0, 0, 15, 15);
    
    popMatrix();
    popMatrix();
    if (dist(lx+x, ly+y, 400, 400) < 65 && mousePressed && mouseButton == LEFT) {
      dead = true;
      tCount++;
    }
  }
}