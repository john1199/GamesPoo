class BrakeDown extends StatusGame {
  Ball ball;
  Block[][] blockArray;
  Paddle paddle;
  int columns, rows;

  public BrakeDown() {
    ball = new Ball();
    paddle = new Paddle();
  }
  public BrakeDown(int _columns, int _rows) {
    rows = _rows;
    columns = _columns;
    ball = new Ball();
    paddle = new Paddle();
    blockArray = new Block[rows][columns];
    init();
  }

  @Override
    void displayScore() {
    fill(255);
    textSize(30);
    textAlign(RIGHT);
    text("Score", 105, height-30);
    textAlign(LEFT);
    text(score, 115, height-30);
    // Display level
    textAlign(RIGHT);
    text("Level", width-80, height-30);
    textAlign(LEFT);
    text(level(), width-60, height-30);
  }
  @Override
    void loser() {
    if (ball.y > height) {
      textSize(40);
      textAlign(CENTER);
      text("Game Over", (width/2)-(paddle.largo/2), height/2);
    }
  }
  @Override
    void restart() {
  }
  @Override
    void gamePlay() {
    ball.drawBall();
    ball.update();
    paddle.drawPaddle();
    paddle.update(37,39,'x');
    paddle.checkCollides(ball);
    drawBlocks();
    loser();
    displayScore();
  }
  int update(int y) {
    return y +=40;
  }
  void init() {
    int largo = (width)/columns;
    int y =30;
    for (int i = 0; i<rows; i++) {
      for (int j = 0; j<columns; j++) {
        if (j == 0)
          blockArray[i][j] = new Block(5, y, largo-10);
        else if (j>0)
          blockArray[i][j] = new Block(largo*j, y, largo-8);
      }
      if (y < height/2) {
        y = update(y);
      }
    }
  }
  void drawBlocks() {
    for (int i = 0; i<rows; i++) {
      for (int j = 0; j<columns; j++) {
        fill(blockArray[i][j].c);
        if (blockArray[i][j].status == true) {
          blockArray[i][j].checkCollides(blockArray[i][j], ball);
          if (j == 0 && blockArray[i][j].y < height/2)
            rect(blockArray[i][j].x, blockArray[i][j].y, blockArray[i][j].ancho, blockArray[i][j].largo);
          else if ( j > 0 && blockArray[i][j].y < height/2)
            rect(blockArray[i][j].x, blockArray[i][j].y, blockArray[i][j].ancho, blockArray[i][j].largo);
        }
      }
    }
  }
  //void drawBlocks() {
  //  int largo = (width)/columns;
  //  int y =30;
  //  for (int i = 0; i<rows; i++) {
  //    for (int j = 0; j<columns; j++) {
  //      fill(blockArray[i][j].c);
  //      if (j == 0 && blockArray[i][j].status == true && y < height/2)
  //        rect(5, y, largo-10, blockArray[i][j].ancho);
  //      else if (blockArray[i][j].status == true && j > 0 && y < height/2)
  //        rect(largo*j, y, largo-8, blockArray[i][j].ancho);
  //      else
  //        break;
  //    }
  //    if (y < height/2){
  //      y = update(y);
  //    }
  //  }
  //}
}
