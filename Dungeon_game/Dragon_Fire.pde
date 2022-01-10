class dragonFire extends GameObject {

  color bulletColor;

  dragonFire(float x, float y, float vx, float vy) {

    lives = 1;
    loc = new PVector(x, y);
    vel = new PVector(vx, vy);
    vel.setMag(4);
    size = 25;
    bulletColor = gold;
    roomX = myPlayer.roomX;
    roomY = myPlayer.roomY;
  }


  void show() {
    //drawing bullets
    stroke(0);
    fill(bulletColor);
    circle(loc.x, loc.y, size);
  }

  void act() {
    loc.add(vel);
  }
}
