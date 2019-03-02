Ball ball;
Stick stick;
void setup() {
  //size(500,600);
  fullScreen();
  ball = new Ball();
  stick = new Stick();
}
void draw() {
  background(155);
  ball.drawBall();
  stick.drawStick();
  stick.update();
  //print(width);
}
