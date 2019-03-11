class Block {
  int x, y, ancho, largo;
  boolean status;
  color c;
  int score;

  public Block() {
    status = true;
    largo = 10;
    c = color(random(255), random(255), random(255));
    score =0;
  }
  public Block(int _x, int _y, int _ancho) {
    x = _x;
    y = _y;
    ancho = _ancho;
    status = true;
    largo = 15;
    c = color(random(255), random(255), random(255));
  }
  void drawBlock() {
    strokeWeight(5);
    rect(x, y, ancho, largo);
  }
  void checkCollides(Block block, Ball ball) {
    // x < ballPositionX && (x+largo) > ballPositionX && y < ballPositionY && y+ancho > ballPositionY
    if ( block.x < ball.x-ball.radio && (block.x+block.ancho) > ball.x-ball.radio && block.y < ball.y-ball.radio && block.y+block.largo > ball.y-ball.radio) {
      block.status  = false;
      ball.speedBallY = -ball.speedBallY;
      score =1;
    }
    if ( block.x > ball.x+ball.radio && (block.x+block.ancho) < ball.x+ball.radio && block.y > ball.y+ball.radio && block.y+block.largo < ball.y+ball.radio) {
      block.status  = false;
     // ball.speedBallY = -ball.speedBallY;
      ball.speedBallX = -ball.speedBallX;
    }
  }
}
