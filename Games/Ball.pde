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
  void update(Paddle paddle, Paddle paddle2) {
    if (y + radio > height) {
      speedBallY = -1*speedBallY;
      y=height-radio;
    }
    if (y - radio < 0) {
      speedBallY = -1*speedBallY;
      y=radio;
    }
    if (x -radio < paddle.x + paddle.ancho && y >= paddle.y && y <= paddle.y+paddle.largo) {
      speedBallX *= -1;
      speedBallX = (speedBallX-speedInit>radio)? speedBallX : speedBallX+1 ;
      veloy(paddle.y, paddle.largo);
      x= paddle.x + paddle.ancho+radio;
    }

    if (x + radio > paddle2.x && y >= paddle2.y && y <= paddle2.y + paddle2.largo) {
      speedBallX *= -1;
      speedBallX = (speedBallX+speedInit<(-1*radio))? speedBallX : speedBallX-1 ;
      veloy(paddle2.y, paddle2.largo);
      x= paddle2.x-radio;
    }
    if (x+radio < paddle.x+paddle.ancho || x-radio > paddle2.x) {
      int s;
      s =(speedBallX>0)? 1 : 0;
      init();
      Score(s);
      speedBallX = (s==1)?speedBallX : -1*speedBallX;
      int j= millis();
      while (millis()<j+800) {
      }
    }
    x += speedBallX;
    y += speedBallY;
  }
  void veloy(int a, int b) {
    int c = y-(a+(b/2));
    int s=b/10;
    if (c<0) {
      c=abs(c);
      if (c>s || c<(3*s)) {
        speedBallY -=1 ;
      } else if (c>3*s) { 
        speedBallY -=2 ;
      }
    } else {
      if (c>s || c<3*s) {
        speedBallY +=1 ;
      }
      if (c>3*s) {
        speedBallY +=2 ;
      }
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
