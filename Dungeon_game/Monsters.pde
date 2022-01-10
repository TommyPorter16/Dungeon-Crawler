class monsters extends GameObject {

  color monsterColor;
  int DecidingIfDrop = int(random(1, 3));
  boolean DropItem;

  monsters () {
    size = 80;
    monsterColor = pink;
    lives = 100;
    roomX = 1;
    roomY = 1;
  }


  monsters(int hp, int s, color c, int x, int y) {
    lives_max = lives = hp;
    size = s;

    monsterColor = c;
    roomX = x;
    roomY = y;
    xp = 5;
  }


  void show() {

    stroke(0);
    strokeWeight(2);
    fill(monsterColor);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();

    if (DecidingIfDrop >= 2) {
      DropItem = true;
    }


    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && isCollidingWith(obj)) {

        lives = lives - int(obj.vel.mag());
        obj.lives = 0;



        if (lives <= 0) {
          myPlayer.xp = myPlayer.xp + xp;
          myObjects.add(new message(new PVector(0, -1), loc.x, loc.y, "+" + xp + "xp"));
          if (DropItem) {

            myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY));
          }
        }
      }
      i++;
    }
  }
}
