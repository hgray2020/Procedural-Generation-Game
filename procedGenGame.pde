PImage grass;
Entity steve = new Entity(200, 200, 5, 5);
int bSize = 30;
int numBiomes = 11;
ArrayList<Biome> biomes = new ArrayList<Biome>();
int speed = 10;
float scale = 1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Grass> gList = new ArrayList<Grass>();
ArrayList<Stick> sticks = new ArrayList<Stick>();
ArrayList<Torch> torches = new ArrayList<Torch>();
ArrayList<Monster> monsters = new ArrayList<Monster>();
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
boolean spawned = false;
boolean attack = false;
int cool = 0;
int pow = 2;
float rot;

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

void mouseClicked() {
  clicked = true;
}

void debugScreen() {
  fill(255);
  rectMode(CORNER);
  rect(0, 0, 150, 300);
  fill(0);
  textAlign(CORNER);
  text(round(frameRate), 10, 25);

  text(-1*(lx/10), 10, 50);
  text(-1*(ly/10), 10, 75);
  text(time, 10, 100);
  text(mouseX, 10, 125);
  text(mouseY, 10, 150);
  text(rot, 10, 175);
  text(attack+"", 10, 200);
  text(cool, 10, 225);
  textAlign(CENTER);
  rectMode(CENTER);
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
  for (int p = 0; p < monsters.size(); p++) {
    if (monsters.get(p).dead) {
      monsters.remove(p);
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
  //inv.add(new Item("Knife", 4, 1, 1));
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
  if (time == (6*cycle)/10) {
    spawned = true;
  }
  if (spawned) {
    for (int p = 0; p < 10; p++) {
      monsters.add(new Monster(400+round(random(-400, 400)), 400+round(random(-400, 400)), 5, 20));
    }
    spawned = false;
  }

  if (loadNew) {
    loadWorld();
  }
  loadNew = false;
  background(82-darkness, 82-darkness, 255-darkness);
  mapThing();

  rot = atan2(mouseY-400, mouseX-400)+HALF_PI;

  pushMatrix();
  translate(400, 400);

  rectMode(CENTER);
  rotate(rot);
  fill(0, 165-darkness, 200-darkness);
  rect(0, 0, 50, 50);
  fill(80-darkness);
  stroke(0);
  line(0, 0, 0, -400);
  line(0, 0, -400*sqrt(2), -400*sqrt(2));
  line(0, 0, 400*sqrt(2), -400*sqrt(2));
  
  noStroke();
  rect(0, -12.5, 50, 25);
  popMatrix();


  if (keys['w']) {
    lx-=sin(rot)*speed;
    ly+=cos(rot)*speed;
  }
  if (keys['a']) {
    lx+=cos(rot)*speed;
    ly+=sin(rot)*speed;
  }
  if (keys['s']) {
    lx+=sin(rot)*speed;
    ly-=cos(rot)*speed;
  }
  if (keys['d']) {
    lx-=cos(rot)*speed;
    ly-=sin(rot)*speed;
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
    for (int p = 0; p < inv.size(); p++) {
      if (inv.get(p).name == "Torch") {
        inv.get(p).c = inv.get(p).c-1;
      }
    }
  }
  if (pd > 0) {
    pd--;
  }



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

  for (Item i : inv) {
    if (i.id == 3 && i.c < 1) {
      torch = false;
    }
  }
  for (Torch t : torches) {
    t.display();
  }
  if (inv.size() > 0) {
    if (mousePressed && inv.get(sel).id == 4 && cool == 0) {
      attack = true;
      cool = 30;
    }
  }
  for (Monster m : monsters) {
    m.act();
  }
  if (cool < 15) {
    attack = false;
  }
  if (cool > 0) {

    cool--;
  }
}