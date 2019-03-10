class BrakeDown extends StatusGame {
  Ball ball;
  Block[][] blockArray;
  Paddle paddle;
  int columns, rows;
  color c;

  public BrakeDown() {
    ball = new Ball();
    paddle = new Paddle();
  }
  public BrakeDown(int _columns, int _rows) {
    //backIMG = loadImage("Data/background.jpg");
    rows = _rows;
    columns = _columns;
    ball = new Ball(10);
    paddle = new Paddle();
    blockArray = new Block[rows][columns];
    c = color(205, 244, 0);
    init();
  }
  @Override
    void score(int n) {
    if (n==1) {
      //score1+=1;
    } else {
      //score2+=1;
    }
  }
  @Override
    void displayScore() {
    fill(255);
    textSize(30);
    textAlign(RIGHT);
    text("Score", 105, height-30);
    textAlign(LEFT);
    text("", 115, height-30);
    // Display level
    textAlign(RIGHT);
    text("Level", width-80, height-30);
    textAlign(LEFT);
    text("", width-60, height-30);
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
    //image(backIMG,0,0);  
    ball.drawBall();
    update();
    paddle.drawPaddle(c);
    paddle.update(97, 100, 'x');
    paddle.checkCollides(ball);
    drawBlocks();
    loser();
    displayScore();
    keyPressed();
  }
  int update(int y) {
    return y +=height/32;
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
  @Override
    void update() {  
    if (ball.x+ball.radio > width ) {
      ball.speedBallX = -ball.speedBallX;
      ball.x=width-ball.radio;
    }
    if (ball.x-ball.radio<0) {
      ball.speedBallX = -ball.speedBallX;
      ball.x=ball.radio;
    }
    if (ball.y -ball.radio< 0 ) {
      ball.speedBallY = -ball.speedBallY;
      ball.y=ball.radio;
    }
    if (paddle.y <ball.y+ball.radio &&  paddle.x < ball.x && paddle.x+paddle.ancho>ball.x ) {
      ball.speedBallY = -ball.speedBallY;
      velo(paddle.x, paddle.ancho);
      ball.y=paddle.y-ball.radio;
    }    
    ball.x +=ball.speedBallX;
    ball.y +=ball.speedBallY;
  }
  @Override
    void velo(int a, int b) {
    int c = ball.x-(a+(b/2));
    int s=b/10;
    if (c<0) {
      c=abs(c);
      if (c>s || c<(3*s)) {
        ball.speedBallX -=1 ;
      } else if (c>3*s) {
        ball.speedBallX -=2 ;
      }
    } else {
      if (c>s || c<3*s) {
        ball.speedBallX +=1 ;
      }
      if (c>3*s) {
        ball.speedBallX +=2 ;
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
  void keyPressed() {
    if (key == '0') {
      state = 0;
    }
  }
}
