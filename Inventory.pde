void inventory() {
  fill(80, 150);
  stroke(255);
  strokeWeight(1);
  for (int x = 175; x < 625; x+=50) {
    rect(x, 760, 50, 50);
  }
  for (int x = 0; x < 9; x++) {
    if (x == sel) {
      strokeWeight(4);
      rect(175+(x*50), 760, 50, 50);
    }
  }
  for (Item i : inv) {
    i.display();
  }
  for (int p = 0; p < inv.size(); p++) {
    Item i = inv.get(p);
    if (i.id == 3 && sel == (int)i.slot && i.c > 0) {
      println("ye"+frameCount);
      torch = true;
    } else if (i.id == 3 && sel != (int)i.slot && i.c < 1) {
      torch = false;
    }
  }
}