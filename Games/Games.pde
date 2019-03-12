PImage backBrake;
PImage backPong;
PImage backMenu;
PFont fuente;
Pong pong;
BrakeDown brakeDown;
Car car;
int state = 0;
int k=0;

void setup() { 
  size(520, 600);
  //fullScreen();
  //backMenu= loadImage("Data/background0.jpg");
  fuente = loadFont("Fonts/Escapists-48.vlw");
  backBrake= loadImage("Data/background.jpg");
  backPong= loadImage("Data/background2.jpg");
  brakeDown = new BrakeDown(15, 10);
  pong = new Pong();
  car = new Car();
}
void draw() {
  menu();
}
void menu() {
  switch(state) {
  case 0:
    background(255);
    //image(backMenu, 0, 0, width, height);
    textFont(fuente); 
    fill(0);
    textSize(map(width, 0, 1000, 1, 60));
    text("Welcome select a game", width/3.8, height/4);
    text("0.  Menu", width/3, height/2.8);
    text("1.  BreakDown", width/3, height/2.4);
    text("2.  Ping Pong", width/3, height/2.1);
    text("3.  CarRace", width/3, height/1.85);
    break;
  case 1:
    image(backBrake, 0, 0);
    brakeDown.gamePlay();
    break;
  case 2:
    image(backPong, 0, 0); 
    pong.gamePlay();
    break;
  case 3:
    background(0);
    car.gamePlay();
    break;
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
  }else if (key == '3') {
    state =3;
  }
}
