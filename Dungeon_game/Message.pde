class message extends GameObject {

  String text;
  int opacity;
  message(PVector _vel, float x, float y, String t) {
    loc = new PVector (x, y);
    size = 50;
    lives = 1;
    vel = _vel;
    text = t;
    roomX = myPlayer.roomX;
    roomY = myPlayer.roomY;
    opacity = 255;
  }

  void show() {
    //drawing bullets
    noStroke();
    fill(black, opacity);
    textSize(25);
    text(text, loc.x, loc.y);
  }


  void act() {
    loc.add(vel);
    opacity = opacity - 3;
  }
}
