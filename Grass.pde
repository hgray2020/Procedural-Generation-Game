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
      if (dist(lx+x, ly+y, 400, 400) < 40) {
        dead = true;
        boolean b = false;
        for (int p = 0; p < inv.size(); p++) {
          Item i = inv.get(p);
          if (i.id == 2) {
            Item t = inv.get(p);
            inv.set(p, new Item(t.name, t.slot, t.id, t.c+1));
            b = true;
          }
        }
        if (!b) {
          boolean a = false;
          for (int p = 0; p < inv.size(); p++) {
            if (inv.get(p) == null) {
              inv.set(p, new Item("Grass", p-1, 2, 1));
              a = true;
            }
          }
          if (!a) {
            inv.add(new Item("Grass", inv.size(), 2, 1));
          }
        }
      }
    }
  }
}