class Monster {
 float x, y, s, h;
 int p;

  Monster(float ex, float why, float speed, float health) {
    x = ex;
    y = why;
    s = speed;
    h = health;
  }
  
  void act(){
   move();
   display();
  }
  
  void move(){
    if(dist(lx+x, ly+y, 400, 400) > 75){
     
     x+=((400-(lx+x))/400)*s;
     y+=((400-(ly+y))/400)*s;
    }
    for (Monster m : monsters) {
      if (e.x != this.x && e.p > p && dist(e.x, e.y, x, y) < 60) {
        x-=((tx-x)/sqrt(sq(tx-x)+sq(ty-y))*speed*timec);
        y-=((ty-y)/sqrt(sq(tx-x)+sq(ty-y))*speed*timec);
      }
    }
  }
  
  void display(){
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