BrakeDown brakeDown;
void setup() {
  //fullScreen();
  size(500,650);
  brakeDown = new BrakeDown(20,5);
}
void draw() {
  background(155);
  brakeDown.gamePlay();
}
