//Tommy Porter
//Dungeon Crawl
//Block 1-3


//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;


//colours 
color bone = #EEE4D8;
color lightgray = #D9D0C3;
color mediumgray = #BBB4A6;
color black = #000000;
color darkgray = #323321;
color pink = #E918ED;
color orange = #F29907;
color lightBlue = #51CBFA;
color lightGreen = #58df1a;
color purple = #641adf;
color red = #FA5353;
color gold = #f7d100;
color snow = #D2F4F5;




//Drops Settings
final int GUN = 0;
final int HEALTH = 1;

//Monster Settings
final int FOLLOWER_HP = 75;
final int FOLLOWER_SIZE = 50;
final color FOLLOWER_COLOR = purple;

final int TELEPORTER_HP = 20;
final int TELEPORTER_SIZE = 50;
final color TELEPORTER_COLOR = orange;

final int TURRET_HP = 100;
final int TURRET_SIZE = 100;
final color TURRET_COLOR = lightBlue;

final int DRAGON_SIZE = 150;
final int FIRE_DRAGON_HP = 1000;
final int ICE_DRAGON_HP = 2500;
final color FIRE_DRAGON_COLOR = red;
final color ICE_DRAGON_COLOR = lightBlue;


//Weapon Settings
final int MACHINEGUN_THRESHOLD = 10;
final int MACHINEGUN_BULLETSPEED = 5;

final int SHOTGUN_THRESHOLD = 50;
final int SHOTGUN_BULLETSPEED = 5;

final int SNIPER_THRESHOLD = 35;
final int SNIPER_BULLETSPEED = 20;

final int GODGUN_THRESHOLD = 1;
final int GODGUN_BULLETSPEED = 50;


//Array Lists and Player
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
Player myPlayer;

//button variables
boolean mouseReleased;
boolean hadPressed;

Button introButton;
Button pauseButton;
Button unpauseButton;
Button increaseHPButton;
Button increaseSpeedButton;
Button increaseDamageButton;


//gifs
gifs introGif;
gifs manUP;
gifs manDOWN;
gifs manLEFT;
gifs manRIGHT;
gifs IceDragon;
gifs FireDragon;


//Font
PFont DungeonFont;
PFont MatrixFont;

//keys
boolean wkey, akey, skey, dkey, spacekey;
int level;




//images
PImage map1, map2,currentMap;
PImage Dragon;
color northRoom, westRoom, eastRoom, southRoom;

boolean FireDragonSlain;
boolean IceDragonSlain;

void setup() {
  //game setup
  size(800, 600);
  mode = INTRO;
  rectMode(CENTER);
  
  //buttons
  textAlign(CENTER, CENTER);
  introButton = new Button("START", 400, 400, 300, 100, bone, black, 60);
  pauseButton = new Button("PAUSE", 750, 50, 50, 50, bone, black, 15);
  unpauseButton = new Button("PLAY", 750, 50, 50, 50, bone, black, 15);
  increaseHPButton = new Button("+", 200, 200, 75, 75, bone, black, 40);
  increaseSpeedButton = new Button("+", 200, 350, 75, 75, bone, black, 40);
  increaseDamageButton = new Button("+", 200, 500, 75, 75, bone, black, 40);
  
  //gifs
  introGif = new gifs(16, 1, "frame_", "_delay-0.1s.gif");
  
  //fonts and images
  DungeonFont = createFont("DungeonFont.ttf", 20);
  MatrixFont = createFont("Matrix.ttf", 20);
  
  map1 = loadImage("map.png");
  map2 = loadImage("map2.png");
  currentMap = map1;
  level =1;
  Dragon = loadImage("Dragon.png");
  FireDragonSlain = false;
  IceDragonSlain = false;
  
  //keys
  wkey = akey = skey = dkey = false;

  
  

  //Load Sprite
  manUP = new gifs(4, 10, "man/up/sprite_", ".png");
  manDOWN = new gifs(4, 10, "man/down/sprite_", ".png");
  manLEFT = new gifs(4, 10, "man/left/sprite_", ".png");
  manRIGHT = new gifs(4, 10, "man/right/sprite_", ".png");
  myObjects = new ArrayList<GameObject>();


  //Dragon Animation
  IceDragon = new gifs(4,8,"frame_", "_delay-0.3s.gif");
  FireDragon = new gifs(6,8,"frame_", "_delay-0.15s.gif");
  
  
  
  myPlayer = new Player();


  int size = 5;
  int x = 0;
  int y = 0;


  darkness = new ArrayList<DarknessCell>();
  int i = 0;
  while (i < width*height/(size*size)) {
    if (x < width) {
      darkness.add(new DarknessCell(x, y, size));
      x = x + size;
      i++;
    } else {
      x = 0;
      y = y + size;
      i++;
    }
  }


 

}



void draw() {

  if (mousePressed) hadPressed = true;
  if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else {
    mouseReleased = false;
  }




  if (mode == INTRO) {
    intro();
    textFont(DungeonFont);
    introGif.show();
    introButton.show();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (keyCode == ' ') spacekey = true;

}


void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (keyCode == ' ') spacekey = false;
  
}
