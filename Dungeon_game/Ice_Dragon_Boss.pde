class IceDragon extends monsters {

  int choosingAttack = int(random(0, 2));
  int attackThreshold = 150;
  PVector IceVel = new PVector(0, 0);

  IceDragon (int x, int y) {
    super(FIRE_DRAGON_HP, DRAGON_SIZE, ICE_DRAGON_COLOR, x, y);
    xp = 250;
  }



  void show() {

    //image(Dragon,loc.x - 100,loc.y- 100,DRAGON_SIZE,DRAGON_SIZE);
    IceDragon.show(loc.x-100, loc.y-100, 200, 200);
    rectMode(CORNER);
    strokeWeight(2);
    stroke(black);
    fill(red);
    rect(loc.x - 75, loc.y-85, map(lives_max, 0, lives_max, 0, 150), 10);
    fill(lightGreen);
    rect(loc.x - 75, loc.y-85, map(lives, 0, lives_max, 0, 150), 10);

    rectMode(CENTER);
  }


  void act() {
    super.act();

    if (loc.y < 60 + size/2)        vel = new PVector(0, 0);
    if (loc.y > height - 60 - size/2) vel = new PVector(0, 0);
    if (loc.x < 60 + size/2) vel = new PVector(0, 0);
    if (loc.x > width - 60 - size/2) vel = new PVector(0, 0);

    attackThreshold--;
    if (attackThreshold <= 0) {
      if (choosingAttack == 0) {
        chargeAttack();
      } else if (choosingAttack == 1) {
        breathWeapon();
      } 
      attackThreshold = 100;
      choosingAttack = int(random(0, 2));
    }

    if (lives <= 0) {
      IceDragonSlain = true;
    }
  }



  void chargeAttack() {
    vel = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
    vel.setMag(4);
  }

  void breathWeapon() {


    IceVel = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
    IceVel.setMag(5);
    myObjects.add (new dragonSnowball(loc.x, loc.y, IceVel.x, IceVel.y));
  }
}
