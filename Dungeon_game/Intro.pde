void intro() {
  textAlign(CENTER, CENTER);
  textSize(80);

  fill(bone);
  text("DUNGEON CRAWLERS", 400, 200);

  if (introButton.clicked ) {
    mode = GAME;
    myObjects.add (myPlayer);
    SpawnEnemies();
  }
}
