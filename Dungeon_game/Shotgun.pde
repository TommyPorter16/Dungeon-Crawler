class Shotgun extends Weapon {

  Shotgun() {
    super(SHOTGUN_THRESHOLD, SHOTGUN_BULLETSPEED);
  }


  void shoot() {

    if (shotTimer>= threshold) {
      int i = 0;
      while (i < 6) {
        PVector aimVector = new PVector(mouseX-myPlayer.loc.x, mouseY-myPlayer.loc.y);
        aimVector.rotate(random(-0.3, 0.3));
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(aimVector, pink, 10));

        i++;
      }
      shotTimer = 0;
    }
  }
}
