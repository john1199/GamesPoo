class Ball {
  int radio;
  int x, y;
  float speedBallY, speedBallX, speedInit;
  //boolean space = true;

  public Ball() {
    init();
    radio = radio();
    speedInit=speedBallX;
  }
  public Ball(int _radio){
    radio = _radio;
    init();
  }
  void createBall() {
    ellipseMode(RADIUS);
    fill(255);//random(255),random(255),random(255));
    ellipse(x, y, radio, radio);
  }
  void drawBall() {
    createBall();
  }

  int radio() {
    int s;
    s = (height>width)? width/30 : height/30;
    return s;
  }
  void init() {
    speedBallX = width/450;
    speedBallY =1;
    x = width/2;
    y = height/2;
  }
}
