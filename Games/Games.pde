Ball ball;
Block block;
Stick stick;
void setup() {
  fullScreen();
  ball = new Ball();
  stick = new Stick();
  block = new Block(15, 8);
}
void draw() {
  background(155);
  ball.drawBall();
  stick.drawStick();
  stick.update();
  block.drawBlock();
}
