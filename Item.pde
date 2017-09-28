class Item {

  String name;
  float slot;
  int c, id;

  Item(String n, float s, int i, int co) {
    name = n;
    slot = s;
    c = co;
    id = i;
  }

  void display() {
    if (slot >= 0) {
      di(id, 175+slot*50, 760);
    }
    fill(255);
    text(c, 175+(slot*50)-5, 770);
  }
}