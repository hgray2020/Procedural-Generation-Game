class Monster {
  float x, y, s, h;
  int p;

  Monster(float ex, float why, float speed, float health) {
    x = ex;
    y = why;
    s = speed;
    h = health;
  }

  void act() {
    getP();
    move();
    display();
  }

  void getP() {
    for (int q = 0; q < monsters.size(); q++) {
      if (monsters.get(q).x == this.x && monsters.get(q).y == this.y) {
        p = q;
      }
    }
  }

  void move() {
    if (dist(lx+x, ly+y, 400, 400) > 75) {


      x+=((400-(lx+x))/sqrt(sq(400-(lx+x))+sq(400-(ly+y)))*s);
      y+=((400-(ly+y))/sqrt(sq(400-(lx+x))+sq(400-(ly+y)))*s);
    }
    for (Monster m : monsters) {
      if (m.x != this.x && m.p > this.p && dist(m.x, m.y, x, y) < 90) {
        x-=((400-(lx+x))/sqrt(sq(400-(lx+x))+sq(400-(ly+y)))*s);
        y-=((400-(ly+y))/sqrt(sq(400-(lx+x))+sq(400-(ly+y)))*s);
      }
    }
  }

  void display() {
    pushMatrix();
    translate(lx, ly);
    pushMatrix();
    translate(x, y);
    fill(54-darkness, 179-darkness, 112-darkness);
    rect(0, 0, 50, 50);

    popMatrix();
    popMatrix();
  }
}