class Pong extends StatusGame {
  Paddle paddle1, paddle2;
  Ball ball;
  PFont fuente;
  int score1, score2;
  color c1, c2;

  public Pong() {
    paddle1 = new Paddle(width/50, (height/2)-(height/10), width/50, height/5);
    paddle2 = new Paddle(width-(2*width/50),(height/2)-(height/10), width/50, height/5);
    ball = new Ball();
    fuente = loadFont("Fonts/Escapists-48.vlw");
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
    ball.update(paddle1, paddle2);
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
  }
  
  @Override
  void restart() {
  }
}
