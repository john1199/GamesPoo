BrakeDown brakeDown;
Pong pong;
void setup() {
   fullScreen();
  //size(580, 700);
  brakeDown = new BrakeDown(8, 6);
  pong = new Pong();
}
void draw() {
  background(155);
  brakeDown.gamePlay();
  //pong.gamePlay();
}
