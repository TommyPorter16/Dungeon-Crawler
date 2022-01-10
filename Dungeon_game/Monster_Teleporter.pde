class Teleporter extends monsters {

  int tpTimer = 55;

  Teleporter (int x, int y) {

    super(TELEPORTER_HP, TELEPORTER_SIZE, TELEPORTER_COLOR, x, y);
  }



  void show() {
    super.show();
    rectMode(CORNER);
    strokeWeight(2);
    stroke(black);
    fill(red);
    rect(loc.x - 37, loc.y-40, map(lives_max, 0, lives_max, 0, 75), 10);
    fill(lightGreen);
    rect(loc.x - 37, loc.y-40, map(lives, 0, lives_max, 0, 75), 10);

    rectMode(CENTER);
  }

  void act() {
    super.act();
    tpTimer --;
    if (tpTimer <=0) {

      loc = new PVector(random(80, width-80), random(80, height-80));
      tpTimer = 90;
    }
  }
}
