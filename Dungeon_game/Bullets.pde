class Bullet extends GameObject { 


  color bulletColor;



  Bullet(PVector aim, color c, int s) {
    loc = new PVector (myPlayer.loc.x, myPlayer.loc.y);
    size = s;
    lives = 1;
    bulletColor = c;
    vel = aim;
    roomX = myPlayer.roomX;
    roomY = myPlayer.roomY;
  }

  void show() {
    //drawing bullets
    stroke(255);
    fill(bulletColor);
    circle(loc.x, loc.y, size);
  }


  void act() {
    loc.add(vel);

    if (loc.y < 60 ||  loc.y > height - 60 || loc.x < 60 || loc.x > width - 60) {
      lives = 0;
    }
  }
}
