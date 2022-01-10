void gameover() {

  if (IceDragonSlain) {
    winScreen();
  } else {
    loseScreen();
  }

  if (mouseReleased) {
    mode = INTRO;
    myPlayer.lives = myPlayer.lives_max = 5;
    myPlayer.speed = 5;
    myPlayer.damage = 0;
    myPlayer.roomX = 1;
    myPlayer.roomY = 1;
    myPlayer.immuneTimer = 120;
    myPlayer.currentAction = manDOWN;
    myPlayer.xp = 0;
    FireDragonSlain = false;
    IceDragonSlain = false;
  }
}


void winScreen() {
  background(black);
  fill(bone);
  textSize(85);
  text("YOU WIN", width/2, height/2);
}


void loseScreen() {
  background(black);
  fill(bone);
  textSize(85);
  text("YOU LOSE", width/2, height/2);
}
