class BrakeDown {
  Ball ball;
  Block[][] blockArray;
  Stick stick;
  int columns, rows;

  public BrakeDown() {
    ball = new Ball();
    stick = new Stick();
  }
  public BrakeDown(int _columns, int _rows) {
    rows = _rows;
    columns = _columns;
    ball = new Ball();
    stick = new Stick();
    blockArray = new Block[rows][columns];

    for (int i = 0; i<rows; i++) {
      for (int j = 0; j<columns; j++) {
        blockArray[i][j] = new Block();
      }
    }
  }
  void gamePlay() {
    ball.drawBall();
    stick.drawStick();
    drawBlocks();
  }
  int update(int y) {
    return y +=30;
  }
  void drawBlocks() {
    int largo = (width)/columns;
    int y =20;
    for (int i = 0; i<rows; i++) {
      for (int j = 0; j<columns; j++) {
        fill(blockArray[i][j].c);
        if (j == 0 && blockArray[i][j].status == true && y < height/2)
          rect(5, y, largo-10, blockArray[i][j].ancho);
        else if (blockArray[i][j].status == true && j > 0 && y < height/2)
          rect(largo*j, y, largo-8, blockArray[i][j].ancho);
        else
          break;
      }
      if (y < height/2){
        y = update(y);
      }
    }
  }
}