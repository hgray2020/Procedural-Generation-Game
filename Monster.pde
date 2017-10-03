class Monster {
  float x, y, s, h;
  int p;
  boolean dead;
  Point arc;
  int re;

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
    if(h <= 0){
     dead = true; 
    }
    calcArc();
    if(attack && rot < arc.y && rot > arc.x && dist(lx+x, ly+y, 400, 400) < 85){
     h-=pow; 
     re = 50;
    }
    if(re > 0){
     re--; 
    }
  }
  
  void calcArc(){
    float min, max;
    stroke(0);
    strokeWeight(2);
    float r = atan2((ly+y)-400, (lx+x)-400)+HALF_PI;
    
    min = r-QUARTER_PI;
    max = r+QUARTER_PI;
    
    arc = new Point(min, max);
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
    noStroke();
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