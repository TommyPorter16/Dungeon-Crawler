class DarknessCell {
  float opacity;
  int x, y, size;

  DarknessCell(int _x, int _y, int s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 0;
  }

  void show() {
    rectMode(CORNER);
    float d = dist (myPlayer.loc.x, myPlayer.loc.y, x, y);
    opacity = map(d, 0, 380, 0, 255);
    noStroke();
    fill(0, opacity);
    rect(x, y, size, size);
    rectMode(CENTER);
  }
}
