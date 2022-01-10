void pause() {

  int hpCost = 10;
  int speedCost = 40;
  int damageCost = 4;


  background(red);
  textFont(MatrixFont);
  textSize(50);
  fill(black);
  text("YOU HAVE " + myPlayer.xp + " XP", 250, 50); 
  text("HEALTH: " + myPlayer.lives_max, 400, 200);
  text("SPEED: " + myPlayer.speed, 400, 350);
  text("DAMAGE: " + myPlayer.damage, 400, 500);
  text("COST: ", 100, 125);
  text(hpCost, 100, 200);
  text(speedCost, 100, 350);
  text(damageCost, 100, 500);
  increaseHPButton.show();
  increaseSpeedButton.show();
  increaseDamageButton.show();


  if (increaseHPButton.clicked && myPlayer.xp >= hpCost) {
    myPlayer.lives_max ++;
    myPlayer.lives ++;
    myPlayer.xp = myPlayer.xp - hpCost;
  }
  if (increaseSpeedButton.clicked && myPlayer.xp >= speedCost) {
    myPlayer.speed ++;
    myPlayer.xp = myPlayer.xp - speedCost;
  }
  if (increaseDamageButton.clicked && myPlayer.xp >= damageCost) {
    myPlayer.damage ++;
    myPlayer.xp = myPlayer.xp - damageCost;
  }



  unpauseButton.show();
  if (unpauseButton.clicked) {
    mode = GAME;
  }
}
