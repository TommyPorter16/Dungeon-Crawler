class Weapon {

  int shotTimer;
  int threshold;
  int bulletSpeed; //speed of projectiles

  Weapon() {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
  }


  Weapon(int thr, int bs) {
    shotTimer = 0;
    threshold = thr;
    bulletSpeed = bs;
  }

  void update() {
    shotTimer++;
  }

  void shoot() {
    if (shotTimer>= threshold) {
      PVector aimVector = new PVector(mouseX-myPlayer.loc.x, mouseY-myPlayer.loc.y);
      aimVector.setMag(bulletSpeed + myPlayer.damage);
      myObjects.add(new Bullet(aimVector, pink, 10));
      shotTimer = 0;
    }
  }
}
