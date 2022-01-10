class GameObject {

  int lives, lives_max;
  PVector loc;
  PVector vel;
  int size;
  int roomX, roomY;
  int damage;
  int speed;
  int xp;

  GameObject() {
    loc = new PVector (width/2, height/2);
    vel = new PVector (0, 0);
    lives = 1;
  }

  void show() {
  }

  void act() {

    loc.add(vel);

    if (loc.y < 60)        loc.y = 60;
    if (loc.y > height - 60) loc.y = height - 60;
    if (loc.x < 60) loc.x = 60;
    if (loc.x > width - 60) loc.x = width - 60;
  }


  //checking if objects are in the same room
  boolean inRoomWith(GameObject myObjects) {
    if (roomX == myObjects.roomX && roomY == myObjects.roomY) {
      return true;
    } else {
      return false;
    }
  }

  //checking if objects are colliding
  boolean isCollidingWith(GameObject myObjects) {
    float d = dist(myObjects.loc.x, myObjects.loc.y, loc.x, loc.y);
    if (inRoomWith(myObjects) && d < size/2 + myObjects.size/2 && lives > 0) {
      return true;
    } else {
      return false;
    }
  }
}
