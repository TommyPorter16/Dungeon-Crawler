class Turret extends monsters {

  int threshold = 60;
  int shotTimer = 0;

  float vx, vy;

  Turret (int x, int y) {
    super (TURRET_HP, TURRET_SIZE, TURRET_COLOR, x, y);
    monsterColor = lightBlue;
    vx = vy = 0;
  }

  void show() {

    super.show();
    rectMode(CORNER);
    strokeWeight(2);
    stroke(black);
    fill(red);
    rect(loc.x -40, loc.y-40, map(lives_max, 0, lives_max, 0, 75), 10);
    fill(lightGreen);
    rect(loc.x -40, loc.y-40, map(lives, 0, lives_max, 0, 75), 10);

    rectMode(CENTER);
  }

  void act() {

    super.act();


    //calculating shot line
    vy = myPlayer.loc.y-loc.y;
    vx = myPlayer.loc.x-loc.x;

    //shooting bullets
    shotTimer++;
    if (shotTimer >= threshold) {
      myObjects.add(new EnemyBullets(loc.x, loc.y, vx, vy));
      shotTimer = 0;
    }
  }
}
