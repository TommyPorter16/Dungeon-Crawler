class Player extends GameObject {



  int speed;
  int damage;
  Weapon myWeapon;
  gifs currentAction;
  int immuneTimer;

  Player() {
    super();
    lives_max = lives = 5;
    size = 75;
    speed = 5;
    roomX = 1;
    roomY = 1;
    immuneTimer = 120;
    myWeapon = new Weapon();
    currentAction = manDOWN;
    xp = 0;
    damage = 0;
  }

  void show() {

    fill(bone);
    if (immuneTimer>0) {
      fill(pink, 100);
      circle(loc.x, loc.y, size*1.4);
    } 


    currentAction.show(loc.x - 25, loc.y - 25, size/1.5, size);
    rectMode(CORNER);
    strokeWeight(2);
    stroke(black);
    fill(red);
    rect(loc.x - 25, loc.y-40, map(lives_max, 0, 5, 0, 50), 10);
    fill(lightGreen);
    rect(loc.x - 25, loc.y-40, map(lives, 0, 5, 0, 50), 10);
    //textSize(15);
    //text(lives, loc.x, loc.y-35);
    rectMode(CENTER);
  }



  void act () {
    super.act();



    if (wkey) {
      vel.y = -speed ;
      currentAction = manUP;
    }
    if (skey) {
      vel.y = speed;
      currentAction = manDOWN;
    }
    if (akey) {
      vel.x = -speed;
      currentAction = manLEFT;
    }
    if (dkey) {
      vel.x = speed;
      currentAction = manRIGHT;
    }

    if (vel.mag() > speed) {
      vel.setMag(speed);
    }

    if (!wkey && !skey) vel.y = 0;
    if (!akey && !dkey) vel.x = 0;


    //check exits
    if (northRoom != #FFFFFF && loc.y == 60 && loc.x >= width/2-50 && loc.x <= width/2 +50) {
      roomY--;
      loc = new PVector (width/2, height -70);
      cleanUp();
    } else if (eastRoom != #FFFFFF && loc.x == width - 60 && loc.y >= height/2-50 && loc.y <= height/2 +50) {
      roomX++;
      loc = new PVector (70, height/2);
      cleanUp();
    } else if (southRoom != #FFFFFF && loc.y == height - 60 && loc.x >= width/2-50 && loc.x <= width/2 +50) {
      roomY++;
      loc = new PVector (width/2, 70);
      cleanUp();
    } else if (westRoom != #FFFFFF && loc.x == 60 && loc.y >= height/2-50 && loc.y <= height/2 +50) {
      roomX--;
      loc = new PVector (width-70, height/2);
      cleanUp();
    }

    myWeapon.update();
    if (mousePressed) myWeapon.shoot();



    // immunity + getting hit
    immuneTimer--;

    if (immuneTimer <= 0) {
      int i = 0;
      while (i < myObjects.size()) {
        GameObject myObj = myObjects.get(i);
        if (myObj instanceof monsters && isCollidingWith(myObj)|| myObj instanceof EnemyBullets && isCollidingWith(myObj) || myObj instanceof dragonFire && isCollidingWith(myObj) || myObj instanceof dragonSnowball && isCollidingWith(myObj)) {

          immuneTimer = 120;
          lives--;
        }
        if (myObj instanceof DroppedItem && isCollidingWith(myObj)) {
          DroppedItem item = (DroppedItem) myObj;
          if (item.type == GUN); 
          {
            myWeapon = item.w;
            item.lives = 0;
          } 
          if (item.type == HEALTH) {
            if (lives < lives_max) {
              lives++;
              item.lives = 0;
            }
          }
        }
        i++;
      }
    }
  }

  void cleanUp() {

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet || obj instanceof message || obj instanceof EnemyBullets) {
        if (!inRoomWith(obj)) {
          myObjects.remove(i);
          i--;
        }
      }
      i++;
    }
  }
}
