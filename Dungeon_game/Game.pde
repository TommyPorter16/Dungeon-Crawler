void game() {
  drawRoom();
  if (FireDragonSlain) {
    openPortal();
  }
  drawGameObjects();
  drawMiniMap();

  textFont(MatrixFont);
  pauseButton.show();
  if (pauseButton.clicked) {
    mode = PAUSE;
  }
  if (myPlayer.lives <= 0) {
    mode = GAMEOVER;
  }

  if (FireDragonSlain && myPlayer.loc.x > width/2-50 && myPlayer.loc.x < width/2+50 && myPlayer.loc.y > height/2-50 && myPlayer.loc.y < height/2+50) {
    myPlayer.roomX = 1;
    myPlayer.roomY = 1;
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof monsters || obj instanceof DroppedItem) {
        obj.lives = 0;
      }
      i++;
    }
    currentMap = map2;
    SpawnEnemies();
    FireDragonSlain = false;
    myObjects.add(new message(new PVector(0, 0), width/2, height/4, "Level 2"));
  }
  if (IceDragonSlain) {
    mode = GAMEOVER;
  }
}

void drawRoom() {
  //the room
  background (darkgray);
  strokeWeight(8);
  stroke(0);
  line(0, 0, 60, 60);
  line(width, 0, width-60, 60);
  line(0, height, 60, height-60);
  line(width, height, width-60, height-60);


  northRoom = map1.get(myPlayer.roomX, myPlayer.roomY-1);
  eastRoom = map1.get(myPlayer.roomX+1, myPlayer.roomY);
  southRoom = map1.get(myPlayer.roomX, myPlayer.roomY+1);
  westRoom = map1.get(myPlayer.roomX-1, myPlayer.roomY);

  noStroke();
  fill(mediumgray);
  if (northRoom != #FFFFFF) {
    ellipse (width/2, 60, 100, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse (width-60, height/2, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse (width/2, height-60, 100, 100);
  }
  if (westRoom != #FFFFFF) {
    ellipse (60, height/2, 100, 100);
  }



  //the floor
  fill(lightgray);
  rect(width/2, height/2, width-120, height-120);
}

void drawGameObjects() {
  //act/show all objects

  for (int i = 0; i < myObjects.size(); i++) {
    GameObject myObj = myObjects.get(i);
    if (myObj.inRoomWith(myPlayer)) {
      myObj.show();
      myObj.act();

      //removing all objects if lives = 0
      if (myObj.lives <= 0) {
        myObjects.remove(i);
        i--;
      }
    }
  }



  int ii = 0;
  while (ii < darkness.size()) {
    darkness.get(ii).show();


    ii++;
  }
}


void drawMiniMap() {
  rectMode(CORNER);
  float size = 8;
  int x = 0;
  int y = 0;

  while (y < currentMap.height) {

    color c = currentMap.get(x, y);
    fill(c);
    if (x == myPlayer.roomX && y == myPlayer.roomY) fill(pink);
    square(x*8 + 40, y*8 + 40, size);
    x = x + 1;

    if ( x >= currentMap.width) {

      x = 0;
      y = y + 1;
    }
  }

  rectMode(CENTER);
}

void SpawnEnemies() {
  int x = 0;
  int y = 0;
  while (y < currentMap.height) {
    color roomColor = currentMap.get(x, y);
    if (roomColor == lightGreen) {
      myObjects.add (new Follower(x, y));
    }
    if (roomColor == purple) {
      myObjects.add (new Turret(x, y));
    }
    if (roomColor == lightBlue) {
      myObjects.add (new Teleporter(x, y));
    }
    if (roomColor == gold) {
      myObjects.add (new FireDragon(x, y));
    }
    if (roomColor == red) {
      myObjects.add (new IceDragon(x, y));
    }
    x++;
    if (x == currentMap.width) {
      x = 0;
      y++;
    }
  }
}

void openPortal() {
  strokeWeight(5);
  stroke(black);
  fill(lightBlue);
  ellipse(width/2, height/2, 75, 150);
}
