class Biome {
  int r;
  float x, y;
  int type; //0 is grassy, 1 is sandy, 2 is rocky

  Biome(int t, int rad, float ex, float why) {
    if (loadNew) {
      float temp = (random(0, 5));
      if (temp <= 2) {
        type = 0;
      }
      if (temp > 2 && temp <= 4) {
        type = 2;
      }
      if (temp > 4) {
        type = 1;
      }

      r = rad;
      x = ex;
      y = why;
      int rNum = 0;
      if (type == 0) {
        rNum = round(random(30, 43));
      }
      if (type == 1) {
        rNum = round(random(26, 33));
      }
      if (type == 2) {
        rNum = round(random(35, 70));
      }
      for (int p = 0; p <rNum; p++) {
        rocks.add(new Rock(x+round(random(-1*(r/2), r/2)), y+round(random(-1*(r/2), r/2))));
      }

      if (type == 0) {

        for (float p = -r/2; p < (r/2)-50; p+=50) {
          gList.add(new Grass(x+p, y+round(random(-r/2, r/2))));
        }
      }
      if (type == 1) {

        for (float p = -r/2; p < (r/2)-50; p+=50) {
          sticks.add(new Stick(x+p, y+round(random(-r/2, r/2))));
        }
      }
    } else {
      type = t;
    }
  }

  void display() {
    noStroke();
    pushMatrix();
    translate(lx, ly);

    if (type == 0) {
      fill(13-darkness, 146-darkness, 13-darkness);
    }
    if (type == 1) {
      fill(255-darkness, 255-darkness, 180-darkness);
    }
    if (type == 2) {
      fill(120-darkness);
    }

    rectMode(CENTER);
    rect(x, y, r, r);
    if (type == 0) {
      fill(13-darkness, 146-darkness, 13-darkness, 100-darkness);
    }
    if (type == 1) {
      fill(255-darkness, 255-darkness, 180-darkness, 100-darkness);
    }
    if (type == 2) {
      fill(120-darkness, 100-darkness);
    }
    rect(x, y, r+(bSize/1.2), r+(bSize/1.2));
    popMatrix();
  }
}