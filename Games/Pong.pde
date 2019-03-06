class Pong extends StatusGame {
  Paddle paddle1, paddle2;
  Ball ball;
  PFont fuente;

  public Pong() {
    paddle1 = new Paddle(20, height/3, 20, height/5);
    paddle2 = new Paddle(width-40, height/3, 20, height/5);
    ball = new Ball();
    fuente = loadFont("Fonts/Escapists-48.vlw");
  }
  void gamePlay() {
    displayScore(); 
    noFill();
    paddle1.drawPaddle();
    paddle2.drawPaddle();   
    paddle1.update(119, 115, 'y');
    paddle2.update(38, 40, 'y');
    ball.drawBall();
    ball.rebote(paddle1,paddle2);
  }
  void displayScore() {
    textFont(fuente);
    textSize(60);
    text(score, (width/2)-50, height/6);
    text("|", (width/2), height/6);
    text(score, (width/2)+40,height/6);
  }
  void loser() {
  }
  void restart() {
  }
}
