class Button {

  //instance variables
  boolean clicked;
  float x, y, w, h;
  String text;
  int _textSize;
  color normal, highlight;


  Button(String t, float px, float py, float pw, float ph, color norm, color high, int ts) {
    clicked = false;
    text = t;
    _textSize = ts;
    x = px;
    y = py;
    w = pw;
    h = ph;
    normal = norm;
    highlight = high;
  }


  void show() {

    rectMode(CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY >y-h/2 && mouseY <y+h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke (0);
    strokeWeight(4);
    rect(x, y, w, h, 30);

    textAlign(CENTER, CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY >y-h/2 && mouseY <y+h/2) {
      fill(normal);
    } else {
      fill(highlight);
    }
    textSize(_textSize);
    text(text, x, y);

    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY >y-h/2 && mouseY <y+h/2) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
