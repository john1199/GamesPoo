class Ball {
  int radio = 5;
  int x, y;
  float speedBallY, speedBallX;
  boolean space = true;

  public Ball() {
    x = width/2;
    y = height/2;
    speedBallX = random(3, 4);
    speedBallY = random(-3, -4);
  }
  
  void createBall() {
    ellipseMode(RADIUS);
    fill(255);//random(255),random(255),random(255));
    ellipse(x, y, radio, radio);
  }
  void drawBall() {
    createBall();
    //if (space) {
    //  createBall();
    //  update();
    //}
    //if (key == BACKSPACE) {
    //  space = !space;
    //}
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
  void rebote(Paddle paddle,Paddle paddle2){
    //ellipse(h,k , d,d);
    
    if (x <= (radio/2)+ paddle.x || x >= paddle2.x){
      x = width / 2;
      y = height / 2;
      if (speedBallX < 0){
        //p2++;puntaje aumenta
        speedBallX *= -1;
      } else {
        //p1++; puntaje aumenta
        speedBallX *= -1;
      }
    }
    if (x <= (radio/2) + (paddle.x + paddle.ancho) && y+(radio/2) >= paddle.y && y-(radio/2) <= paddle.y+paddle.largo){
      speedBallX *= -1;
    }
    
    if (x >= paddle2.x-(radio/2) && y+(radio/2) >= paddle2.y && y-(radio/2) <= paddle2.y + paddle2.largo){
      speedBallX *= -1;
    }
    
    if (y >= height-(radio/2) || y <= radio/2){
      speedBallY *= -1;
    }
    x += speedBallX;
    y += speedBallY;    
}
}
