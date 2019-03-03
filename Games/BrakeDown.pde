class BrakeDown {
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
  void gamePlay() {
    ball.drawBall();
    paddle.drawPaddle();
    paddle.checkCollides(ball);
    drawBlocks();
  }
  int update(int y) {
    return y +=30;
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
        blockArray[i][j].checkCollides(blockArray[i][j],ball);
        if (j == 0 && blockArray[i][j].status == true && blockArray[i][j].y < height/2)
          rect(blockArray[i][j].x, blockArray[i][j].y, blockArray[i][j].largo, blockArray[i][j].ancho);
        else if ( j > 0 && blockArray[i][j].status == true && blockArray[i][j].y < height/2)
          rect(blockArray[i][j].x, blockArray[i][j].y, blockArray[i][j].largo, blockArray[i][j].ancho);
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
