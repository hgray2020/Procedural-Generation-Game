void crafting() {
  fill(255);
  rect(400, 400, 400, 600);
  stroke(255, 150, 150);
  line(560, 140, 590, 110);
  line(560, 110, 590, 140);
  if (mousePressed && mouseX > 555 && mouseX < 600 && mouseY < 145 && mouseY > 100) {
    craft = false;
  }
  pushMatrix();
  translate(275, 150);
  fill(153, 76, 0);
  noStroke();
  //rotate(QUARTER_PI);
  rect(0, 0, 4, 24);
  fill(105);
  rect(2, -3, 8, 18);
  popMatrix();

  pushMatrix();
  translate(235, 150);
  fill(153, 76, 0);
  noStroke();
  //rotate(QUARTER_PI);
  rect(0, 0, 4, 24);
  fill(204, 204, 0);

  rect(0, -12, 4, 4);
  popMatrix();
  if (((clicked) || (mousePressed && keyPressed && keyCode == SHIFT)) && mouseX > 225 && mouseX < 250 && mouseY > 125 && mouseY < 165) {
    for (int p = 0; p < inv.size(); p++) {
      if (inv.get(p).name == "Stick" && inv.get(p).c >= 1) {
        for (int q = 0; q < inv.size(); q++) {
          if (inv.get(q).name == "Rock" && inv.get(q).c >= 2) {
            boolean b = false;
            for (int r = 0; r < inv.size(); r++) {
              Item i = inv.get(r);
              if (i.id == 3) {
                Item t = inv.get(r);
                inv.set(r, new Item(t.name, t.slot, t.id, t.c+1));
                b = true;
              }
            }
            if (!b) {
              inv.add(new Item("Torch", inv.size(), 3, 1));
            }
            inv.get(q).c-=2;
            inv.get(p).c--;
          }
        }
      }
    }
  }
  if (((clicked) || (mousePressed && keyPressed && keyCode == SHIFT)) && mouseX > 255 && mouseX < 285 && mouseY > 125 && mouseY < 165) {
    for (int p = 0; p < inv.size(); p++) {
      if (inv.get(p).name == "Stick" && inv.get(p).c >= 1) {
        for (int q = 0; q < inv.size(); q++) {
          if (inv.get(q).name == "Rock" && inv.get(q).c >= 2) {
            boolean b = false;
            for (int r = 0; r < inv.size(); r++) {
              Item i = inv.get(r);
              if (i.id == 4) {
                Item t = inv.get(r);
                inv.set(r, new Item(t.name, t.slot, t.id, t.c+1));
                b = true;
              }
            }
            if (!b) {
              inv.add(new Item("Knife", inv.size(), 4, 1));
            }
            inv.get(q).c-=2;
            inv.get(p).c--;
          }
        }
      }
    }
  }
}