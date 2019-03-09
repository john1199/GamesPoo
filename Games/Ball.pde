class Ball {
  int radio;
  int x, y;
  float speedBallY, speedBallX, speedInit;
  //boolean space = true;

  public Ball() {
    init();
    radio = r();
    speedInit=speedBallX;
  }

  void createBall() {
    ellipseMode(RADIUS);
    fill(255);//random(255),random(255),random(255));
    ellipse(x, y, radio, radio);
  }
  void drawBall() {
    createBall();
  }

  int r() {
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
  void update() {
    x +=speedBallX;
    y +=speedBallY;
    if (x>width || x<0) {
      speedBallX = -speedBallX;
    }
    if (y < 0 ) {
      speedBallY = -speedBallY;
    }
  }
  
  

  void Score(int n) {
    if (n==1) {
      pong.score1+=1;
    } else {
      pong.score2+=1;
    }
  }
}
