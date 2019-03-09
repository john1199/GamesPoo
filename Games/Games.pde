BrakeDown brakeDown;
Pong pong;
int k=0;
void setup() {
  fullScreen();
  //size(200, 300);
  brakeDown = new BrakeDown(8, 10);
  pong = new Pong();
}
void draw() {
  background(155);
  //brakeDown.gamePlay();
  pong.gamePlay();
}
void keyTyped() {
  k= key;
}
