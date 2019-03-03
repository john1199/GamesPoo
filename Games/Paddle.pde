class Paddle {
  int ancho, largo, x, y;

  public Paddle() {
    ancho = 15;
    largo = width/6;
    x = (width/2)-(ancho/2);
    y = height-100;
  }
  void createPaddle() {
    fill(random(255),random(255),random(255));
    rect(x, y, largo, ancho);
  }
  void drawPaddle() {
    createPaddle();
    update();
  }
  void update() {
    if (keyPressed) {
      if (keyCode == LEFT && x > 0) {
        x -= 10;
      }
      if (keyCode == RIGHT && x < width-200) {
        x += 10;
      }
    }
  }
  void checkCollides(Ball ball){
    int ballPositionX = ball.x;
    int ballPositionY = ball.y;
    if((x-largo) < ballPositionX && (x+largo) > ballPositionX && (y-10) < ballPositionY && (y) > ballPositionY){
       ball.speedBallY = -ball.speedBallY;
    }
  }
}
