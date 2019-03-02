BrakeDown brakeDown;
void setup() {
  fullScreen();
  brakeDown = new BrakeDown(10,8);
}
void draw() {
  background(155);
  brakeDown.gamePlay();
}
