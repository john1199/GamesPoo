class Block {
  int x, y, ancho, largo;
  boolean status;
  color c;

  public Block() {
    status = true;
    ancho = 10;
    c = color(random(255), random(255), random(255));
  }
  public Block(int _x, int _y, int _largo) {
    x = _x;
    y = _y;
    largo = _largo;
    status = true;
    ancho = 10;
    c = color(random(255), random(255), random(255));
  }
  void drawBlock() {
    rect(x, y, largo, ancho);
  }
  void checkCollides(Block block, Ball ball) {
    int ballPositionX = ball.x;
    int ballPositionY = ball.y;
    int blockPositionX = block.x;
    int blockPositionY = block.y;
    if (ballPositionX > blockPositionX+5 && ballPositionX < blockPositionX+185 && ballPositionY > blockPositionY && ballPositionY < blockPositionY+10) {
      block.status  = false;
      ball.speedBallX = -ball.speedBallX;
    }
    if ((ballPositionX >  blockPositionX-8 && ballPositionX <  blockPositionX) || (ballPositionX >  blockPositionX+208 && ballPositionX <  blockPositionX+205) && (ballPositionY > blockPositionY &&  ballPositionY <  blockPositionY+10) && block.status == true) {
      block.status  = false;
      ball.speedBallY = -ball.speedBallY;
    }
    if (((ballPositionX > (blockPositionX-1) && ballPositionX <(blockPositionX+5)) || (ballPositionX>(blockPositionX+295) && ballPositionX <(blockPositionX+201))) && ballPositionY >blockPositionY && ballPositionY <(blockPositionY+20)) {
      block.status  = false;
      ball.speedBallX = -ball.speedBallX;
      ball.speedBallY = -ball.speedBallY;
    }
  }
  //void drawBlock() {
  //  int largo = (width)/numBlocksX;
  //  for (int j = y; j<height/2; j+=50) {
  //    for (int i = 0; i<numBlocksX; i++) {
  //      if (i == 0) {
  //        createBlocks(10, j, largo-20, ancho);
  //      } else if (i > 0) {
  //        createBlocks(largo*i, j, largo-10, ancho);
  //      } else {
  //        break;
  //      }
  //    }
  //  }
  //}
}
