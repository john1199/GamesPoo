BrakeDown brakeDown;
void setup() {
  fullScreen();
  //size(500,650);
  brakeDown = new BrakeDown(12,7);
}
void draw() {
  background(155);
  brakeDown.gamePlay();
}
