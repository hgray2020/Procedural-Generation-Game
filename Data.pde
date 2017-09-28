void loadItems() {
  il.add(new Item("Stick", -1, 0, 0));
  il.add(new Item("Rock", -1, 1, 0));
  il.add(new Item("Grass", -1, 2, 0));
  il.add(new Item("Torch", -1, 3, 0));
  il.add(new Item("Knife", -1, 4, 0));
}

void di(int n, float x, float y) { //all display functions for items (Display Items)
  /*switch(n) {
   case 1:
   pushMatrix();
   translate(x, y);
   fill(153-darkness, 76-darkness, 0);
   noStroke();
   
   rect(0, 0, 4, 24);
   popMatrix();
   case 2:
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
   default:
   
   }*/
  if (n == 0) {
    pushMatrix();
    translate(x, y);
    fill(153-darkness, 76-darkness, 0);
    noStroke();
    rotate(0.7);
    rect(0, 0, 4, 24);
    popMatrix();
  }
  if (n == 1) {
    pushMatrix();
    translate(x, y);
    fill(105-darkness);
    noStroke();
    rotate(2);
    quad(-10, -5, -10, 10, 0, 15, 10, 5);
    fill(255);

    popMatrix();
  }
  if (n == 2) {
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
  }
  if (n == 3) {
    pushMatrix();
    translate(x, y);
    fill(153, 76, 0);
    noStroke();
    //rotate(QUARTER_PI);
    rect(0, 0, 4, 24);
    fill(204, 204, 0);
    rect(0, -12, 4, 4);
    popMatrix();
  }
}