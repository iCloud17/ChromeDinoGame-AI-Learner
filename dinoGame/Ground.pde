class Ground {
  PVector pos;
  float ht = 100;
  Ground() {
    pos = new PVector(0,height-ht);
  }
  
  void show() {
    fill(0);
    rect(pos.x,pos.y,width,3);
  }
  
}
