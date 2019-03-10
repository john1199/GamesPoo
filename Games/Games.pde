PImage backBrake;
PImage backPong;
PImage backMenu;
Pong pong;
BrakeDown brakeDown;
int state = 0;
int k=0;

void setup() { 
  fullScreen();
  //backMenu= loadImage("Data/background0.jpg");
  backBrake= loadImage("Data/background.jpg");
  backPong= loadImage("Data/background2.jpg");
  brakeDown = new BrakeDown(8, 10);
  pong = new Pong();
}
void draw() {
  menu();
}
void menu() {
  switch(state) {
  case 0:
    //image(backMenu, 0, 0, width, height); 
    fill(0);
    textSize(map(width, 0, 1000, 1, 40));
    text("Welcome select a game", width/3.8, 60);
    text("1.  BreakDown", width/3, height/4);
    text("2.  Ping Pong", width/3, height/3);
    text("3.  BreakDown", width/3, height/2.4);
    break;
  case 1:
    image(backBrake, 0, 0); 
    brakeDown.gamePlay();
    break;
  case 2:
    image(backPong, 0, 0); 
    pong.gamePlay();
  }
}
void keyTyped() {
  k= key;
}
void keyPressed() {
  if (key == '1') {
    state = 1;
  } else if (key == '2') {
    state =2;
  }
}
