class Pong extends StatusGame {
  Paddle paddle1, paddle2;
  Ball ball;
  int score1, score2;
  color c1, c2;

  public Pong() {
    paddle1 = new Paddle(width/50, (height/2)-(height/10), width/50, height/5);
    paddle2 = new Paddle(width-(2*width/50), (height/2)-(height/10), width/50, height/5);
    ball = new Ball();
    c1 = color(255, 0, 0);
    c2 = color(0, 255, 0);
  }

  @Override
    void gamePlay() {
    displayScore();
    paddle1.drawPaddle(c1);
    paddle2.drawPaddle(c2);   
    paddle1.update(119, 115, 'y');
    paddle2.update(111, 108, 'y');
    ball.drawBall();
    update();
    loser();
    keyPressed(); 
  }
  void update() {
    if (ball.y + ball.radio > height) {
      ball.speedBallY = -1*ball.speedBallY;
      ball.y=height-ball.radio;
    }
    if (ball.y - ball.radio < 0) {
      ball.speedBallY = -1*ball.speedBallY;
      ball.y=ball.radio;
    }
    if (ball.x -ball.radio < paddle1.x + paddle1.ancho && ball.y > paddle1.y && ball.y < paddle1.y + paddle1.largo) {
      ball.speedBallX *= -1;
      ball.speedBallX = (ball.speedBallX-ball.speedInit > ball.radio)? ball.speedBallX : ball.speedBallX+1 ;
      velo(paddle1.y, paddle1.largo);
      ball.x = paddle1.x + paddle1.ancho + ball.radio;
    }

    if (ball.x + ball.radio > paddle2.x && ball.y > paddle2.y && ball.y < paddle2.y + paddle2.largo) {
      ball.speedBallX *= -1;
      ball.speedBallX = (ball.speedBallX+ball.speedInit < (-1*ball.radio))? ball.speedBallX : ball.speedBallX-1 ;
      velo(paddle2.y, paddle2.largo);
      ball.x= paddle2.x - ball.radio;
    }
    if (ball.x+ball.radio < paddle1.x+paddle1.ancho || ball.x-ball.radio > paddle2.x && restart ==false) {
      int s;
      s =(ball.speedBallX>0)? 1 : 0;
      ball.init();
      score(s);
      ball.speedBallX = (s==1)? ball.speedBallX : -1 * ball.speedBallX;
      int j= millis();
      while (millis()<j+800) {
      }
    }
    ball.x += ball.speedBallX;
    ball.y += ball.speedBallY;
  }
  @Override
    void velo(int a, int b) {
    int c = ball.y-(a+(b/2));
    int s=b/10;
    if (c<0) {
      c=abs(c);
      if (c>s || c<(3*s)) {
        ball.speedBallY -=1 ;
      } else if (c>3*s) { 
        ball.speedBallY -=2 ;
      }
    } else {
      if (c>s || c<3*s) {
        ball.speedBallY +=1 ;
      }
      if (c>3*s) {
        ball.speedBallY +=2 ;
      }
    }
  }
  @Override
    void score(int n) {
    if (n==1) {
      score1+=1;
    } else {
      score2+=1;
    }
  }

  @Override
    void displayScore() {
    textFont(fuente);
    textSize(60);
    text("|", (width/2), height/6);
    fill(255, 0, 0);
    text(score1, (width/2)-50, height/6);
    fill(0, 255, 0);
    text(score2, (width/2)+40, height/6);
    noFill();
  }

  @Override
    void loser() {
    if (score1 == 10 || score2 == 10) {
      textSize(40);
      textAlign(CENTER);
      text("Game Over", (width/2), height/2);
      if (score1 == 10)
        fill(c1);
      else if(score2 == 10)
        fill(c2);
      text("Win", (width/2), height/2.5);
      restart = true;
      if (keyPressed == true) {
        restart();
      }
    }
  }

  @Override
    void restart() {
    paddle1 = new Paddle(width/50, (height/2)-(height/10), width/50, height/5);
    paddle2 = new Paddle(width-(2*width/50), (height/2)-(height/10), width/50, height/5);
    ball = new Ball();
    c1 = color(255, 0, 0);
    c2 = color(0, 255, 0);
    score1 =0;
    score2 =0;
  }
  void keyPressed() {
    if (key == '0') {
      state = 0;
    }
  }
}
