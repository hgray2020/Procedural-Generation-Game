PImage grass;
int bSize = 30;
int numBiomes = 10;
ArrayList<Biome> biomes = new ArrayList<Biome>();
int speed = 10;
float scale = 1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Grass> gList = new ArrayList<Grass>();
ArrayList<Stick> sticks = new ArrayList<Stick>();
ArrayList<Torch> torches = new ArrayList<Torch>();
int sCount;
int rCount;
int gCount;
int tCount;
boolean loadNew =true;
float darkness = 0;
float con = 7;
boolean torch = false;
int delayc = 50;
int cd = delayc;
int delayp = 50;
int pd = delayp;
boolean craft = false;
int sel = 0; //slot selected;
ArrayList<Item> inv = new ArrayList<Item>(); //inventory

ArrayList<Item> il = new ArrayList<Item>(); //arraylist of all items possible

boolean clicked = false;

float cycle = 1000;
float time = cycle/2;

float lx, ly;

boolean[] keys = new boolean[255];

void saveAndExit() {
  String nums = "";
  String[] numbers = {};
  String bDat = "";
  String[] blist = {};
  String rDat = "";
  String[] rlist = {};
  String gDat = "";
  String[] glist = {};
  String sDat = "";
  String[] slist = {};
  for (Biome b : biomes) {
    bDat+=b.type+"t"+b.r+"t"+b.x+"t"+b.y+"f";
  }
  for (Rock ro : rocks) {
    rDat+=ro.x+"t"+ro.y+"t"+ro.r+"x";
  }
  for (Grass g : gList) {
    gDat+=g.x+"t"+g.y+"x";
  }
  for (Stick s : sticks) {
    sDat+=s.x+"t"+s.y+"t"+s.r+"x";
  } 
  nums+=lx+"t"+ly+"t"+sCount+"t"+gCount+"t"+rCount;
  numbers = append(numbers, nums);
  blist = append(blist, bDat);
  rlist = append(rlist, rDat);
  glist = append(glist, gDat);
  slist = append(slist, sDat);
  saveStrings("data//biomes.txt", blist);
  saveStrings("data//numbers.txt", numbers);
  saveStrings("data//rocks.txt", rlist);
  saveStrings("data//grass.txt", glist);
  saveStrings("data//sticks.txt", slist);

  exit();
}

void mouseClicked(){
 clicked = true; 
}

void debugScreen() {
  fill(255);
  rectMode(CORNER);
  rect(0, 0, 150, 250);
  fill(0);
  textAlign(CORNER);
  text(round(frameRate), 10, 10);

  text(-1*(lx/10), 10, 25);
  text(-1*(ly/10), 10, 50);
  text(time, 10, 75);
  text(torches.size(), 10, 100);
  text(mouseX, 10, 125);
  text(mouseY, 10, 150);
  text(craft+"", 10, 175);
  text(sel, 10, 200);
  textAlign(CENTER);
  rectMode(CENTER);
}

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
            if (inv.get(q).c > 2) {
              inv.get(q).c-=2;
            } else {
             inv.remove(q); 
            }
            if (inv.get(p).c > 1) {
              inv.get(p).c--;
            } else {
             inv.remove(p); 
            }
          }
        }
      }
    }
  }
}

void collect() {
  for (int p = 0; p < rocks.size(); p++) {
    rocks.get(p).dead = true;
    rCount++;
  }
  for (int p = 0; p < gList.size(); p++) {
    gList.get(p).dead = true;
    gCount++;
  }
  for (int p = 0; p < sticks.size(); p++) {
    sticks.get(p).dead = true;
    sCount++;
  }
}

void keyPressed() {
  if (key==27) {
    key=0;
    saveAndExit();
  }
  if (keys.length-1<key) {
    keys=expand(keys, key+1);
  }
  keys[key]=true;
}
void keyReleased() {
  if (!keyPressed) {
    if (keys.length-1<key) {
      keys=expand(keys, key+1);
    }
    keys[key]=false;
  }
}

void loadWorld() {
  for (int p = 0; p < gList.size(); p++) {
    gList.remove(0);
  }
  for (int p = 0; p < rocks.size(); p++) {
    rocks.remove(0);
  }
  for (int p = 0; p < sticks.size(); p++) {
    sticks.remove(0);
  }
  for (int p = 0; p < numBiomes; p++) {
    biomes.add(new Biome(round(bSize*random(50, 185)), ((p%numBiomes)*bSize*50), (p%2)*bSize*50, 0));
  }
}

void mapThing() {
  for (Biome b : biomes) {
    b.display();
  }
  for (Rock r : rocks) {
    r.display();
  }
  for (Grass g : gList) {
    g.display();
  }
  for (Stick s : sticks) {
    s.display();
  }
  for (Torch t : torches) {
    t.display();
  }
  for (int p = 0; p < rocks.size(); p++) {
    if (rocks.get(p).dead) {
      rocks.remove(p);
      p--;
    }
  }
  for (int p = 0; p < gList.size(); p++) {
    if (gList.get(p).dead) {
      gList.remove(p);
      p--;
    }
  }
  for (int p = 0; p < sticks.size(); p++) {
    if (sticks.get(p).dead) {
      sticks.remove(p);
      p--;
    }
  }
  for (int p = 0; p < torches.size(); p++) {
    if (torches.get(p).dead) {
      torches.remove(p);
      p--;
    }
  }
}


void setup() {
  /**/
  if (!loadNew) {
    String[] info = {};
    String[] info1 = {};
    String[] info2 = {};
    String[] info3 = {};

    info = loadStrings("data//numbers.txt");
    info1 = split(info[0], "t");
    lx = Float.parseFloat(info1[0]);
    ly = Float.parseFloat(info1[1]);
    sCount = Integer.parseInt(info1[2]);
    gCount = Integer.parseInt(info1[3]);
    rCount = Integer.parseInt(info1[4]);

    info = loadStrings("data//biomes.txt");
    info1 = split(info[0], "f");
    info1 = shorten(info1); 
    for (int c = 0; c < info1.length; c++) {
      info2 = split(info1[c], "t");
      biomes.add(new Biome(Integer.parseInt(info2[0]), Integer.parseInt(info2[1]), Float.parseFloat(info2[2]), Float.parseFloat(info2[3])));
    }


    info = loadStrings("data//grass.txt");
    info1 = split(info[0], "x");
    info1 = shorten(info1); 
    for (int c = 0; c < info1.length; c++) {
      info2 = split(info1[c], "t");
      gList.add(new Grass (Float.parseFloat(info2[0]), Float.parseFloat(info2[1])));
    }
  }
  size(800, 800);
  grass = loadImage("path2.png");
}

void draw() {
  if (keyPressed) {
    if (key == 'l') {
      loadNew = true;
    }
  }
  if (time < cycle/10) {
    darkness-= (con*13)/(cycle/10);
  }
  if (time >= cycle/10 && time <= (5*cycle)/10) {
    darkness = 0;
  }
  if (time > (5*cycle)/10 && time < (6*cycle)/10) {
    darkness+= (con*13)/(cycle/10);
  }
  if (time >= (6*cycle)/10) {
    darkness = con*13;
  }
  time++;

  if (time > cycle) {
    time = 0;
  }

  if (loadNew) {
    loadWorld();
  }
  loadNew = false;
  background(82-darkness, 82-darkness, 255-darkness);
  mapThing();
  println(darkness);

  if (keys['w']) {
    ly+=speed;
  }
  if (keys['a']) {
    lx+=speed;
  }
  if (keys['s']) {
    ly-=speed;
  }
  if (keys['d']) {
    lx-=speed;
  }
  if (keys['q']) {
    if (darkness < 13*con) {
      darkness++;
    }
  }
  if (keys['z']) {
    if (darkness > 0) {
      darkness--;
    }
  }
  if (keyPressed && key == 'k') {
    collect();
  }
  if (mousePressed && mouseButton == RIGHT && pd == 0 && torch) {
    torches.add(new Torch(-1*(lx)+400, -1*(ly)+400));
    pd = delayp;
    tCount--;
  }
  if (pd > 0) {
    pd--;
  }

  rectMode(CENTER);
  fill(0, 165-darkness, 200-darkness);
  rect(400, 400, 50, 50);

  inventory();
  if (torch) {
    fill(200, 50);
    noStroke();
    ellipse(400, 400, 400, 400);
  }
  debugScreen();

  if (keyPressed && key == 'c') {
    craft = true;
  }
  if (keyPressed && key >= 49 && key <= 57) {
    sel = key-49;
  }

  if (craft) {
    crafting();
  }
  clicked = false;
}