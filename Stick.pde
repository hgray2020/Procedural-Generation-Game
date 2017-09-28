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
      if (dist(lx+x, ly+y, 400, 400) < 40) {
        dead = true;
        boolean b = false;
        for (int p = 0; p < inv.size(); p++) {
          Item i = inv.get(p);
          if (i.id == 0) {
            Item t = inv.get(p);
            inv.set(p, new Item(t.name, t.slot, t.id, t.c+1));
            b = true;
          }
        }
        if (!b) {
          inv.add(new Item("Stick", inv.size(), 0, 1));
        }
      }
    }
  }
}