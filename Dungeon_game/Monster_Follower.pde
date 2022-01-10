class Follower extends monsters {


  Follower(int x, int y) {
    super(FOLLOWER_HP, FOLLOWER_SIZE, FOLLOWER_COLOR, x, y);
    loc = new PVector (width/2, height/2);
  }

  void show() {
    super.show();
    rectMode(CORNER);
    strokeWeight(2);
    stroke(black);
    fill(red);
    rect(loc.x - 37, loc.y-40, map(lives_max, 0, lives_max, 0, 75), 10);
    fill(lightGreen);
    rect(loc.x - 37, loc.y-40, map(lives, 0, lives_max, 0, 75), 10);

    rectMode(CENTER);
  }


  void act() {
    super.act();
    if (dist(loc.x, loc.y, myPlayer.loc.x, myPlayer.loc.y) <200 ) {
      vel = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
      vel.setMag(2);
    } else {
      vel = new PVector (0, 0);
    }
  }
}
