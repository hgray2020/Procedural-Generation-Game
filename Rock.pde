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
      boolean b = false;
      for (int p = 0; p < inv.size(); p++) {
        Item i = inv.get(p);
        if (i.id == 1) {
          Item t = inv.get(p);
          inv.set(p, new Item(t.name, t.slot, t.id, t.c+1));
          b = true;
        }
      }
      if (!b) {

        boolean a = false;
        for (int p = 0; p < inv.size(); p++) {
          if (inv.get(p) == null) {
            inv.set(p, new Item("Rock", p-1, 1, 1));
            a = true;
          }
        }
        if (!a) {
          inv.add(new Item("Rock", inv.size(), 1, 1));
        }
      }
    }
  }
}