void inventory(){
  fill(180, 50);
  stroke(255);
  strokeWeight(1);
  for(int x = 175; x < 625; x+=50){
   rect(x, 760, 50, 50); 
  }
  for(int x = 0; x < 9; x++){
   if(x == sel){
    strokeWeight(4);
    rect(175+(x*50), 760, 50, 50);
   }
  }
  for(Item i : inv){
   i.display();
   if(i.slot == sel && i.id == 3){
    torch = true; 
   } else {
    torch = false; 
   }
  }
}