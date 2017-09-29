class Entity {
  float x, y, s, h;

  Entity(float ex, float why, float speed, float health) {
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
  }
  
  void display(){
   pushMatrix();
   translate(lx, ly);
   pushMatrix();
   translate(x, y);
   fill(255);
   rect(0, 0, 50, 50);
   
   popMatrix();
   popMatrix();
  }
  
}