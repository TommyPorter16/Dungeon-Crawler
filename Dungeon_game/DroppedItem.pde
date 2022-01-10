class DroppedItem extends GameObject {

  int DecidingItem = int(random(1, 4));
  int DecidingGun = int(random(1, 3));
  int type;
  Weapon w;
  color c;

  DroppedItem(float x, float y, int rx, int ry) {
    if (DecidingItem <=2) {
      type = GUN;
      c = lightGreen;
      if (DecidingGun == 1) {
        w = new Shotgun();
      } else {
        w = new Sniper();
      }
    } else {
      type = HEALTH;
      c = red;
      w = myPlayer.myWeapon;
    }


    lives = 1;
    loc = new PVector (x, y);
    vel = new PVector (0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(c);
    circle(loc.x, loc.y, size);
  }

  void act() {
  }
}
