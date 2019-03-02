class Ball {
  int radio = 10;
  int x, y;
  float speedBallY,speedBallX;

  public Ball() {
    x = width/2;
    y = height/2;
    speedBallX = 5;
    speedBallY = -3;
  }
  void createBall() {
    ellipseMode(RADIUS);
    fill(0);
    ellipse(x, y, radio, radio);
  }
  void drawBall() {
    createBall();
    update();
    createBall();
  }
  void update() {
    x +=speedBallX;
    y +=speedBallY;
    if (x>width || x<0) {
      speedBallX = -speedBallX;
    }
    if(y < 0 || y > height){
      speedBallY = -speedBallY;
    }
  }
}
