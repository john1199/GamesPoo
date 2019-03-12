class BrakeDown extends StatusGame {
  Ball ball;
  Block[][] blockArray;
  Block block;
  Paddle paddle;
  int columns, rows;
  color c;
  int score;
  int level;

  public BrakeDown() {
    ball = new Ball();
    paddle = new Paddle();
  }
  public BrakeDown(int _columns, int _rows) {
    //backIMG = loadImage("Data/background.jpg");
    rows = _rows;
    columns = _columns;
    ball = new Ball(7);
    paddle = new Paddle();
    block = new Block();
    blockArray = new Block[rows][columns];
    c = color(205, 244, 0);
    init();
    score = 0;
    level = 1;
  }
  @Override
    void score(int n) {
    if (n==1) {
      score +=50;
    }
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
    text(level, width-60, height-30);
  }
  @Override
    void loser() {
    if (ball.y > height) {
      textSize(40);
      textAlign(CENTER);
      text("Game Over", (width/2)-(paddle.largo/2), height/2);
      score = 0;
      if (keyPressed == true) {
        restart();
      }
    }
  }
  @Override
    void restart() {
    ball = new Ball(7);
    paddle = new Paddle();
    blockArray = new Block[rows][columns];
    c = color(205, 244, 0);
    init();
    score = 0;
    level = 1;
  }
  @Override
    void gamePlay() {
    //image(backIMG,0,0); 
    paddle.drawPaddle(c);
    paddle.update(97, 100, 'x');
    drawBlocks(); 
    ball.drawBall();
    update();
    loser();
    displayScore();
    keyPressed();
  }
  int update(int y) {
    return y +=block.largo;
  }
  void init() {
    int largo = (width)/columns;
    int y =30;
    for (int i = 0; i<rows; i++) {
      for (int j = 0; j<columns; j++) {
        if (j == 0)
          blockArray[i][j] = new Block(5, y, largo);
        else if (j>0)
          blockArray[i][j] = new Block(largo*j, y, largo);
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
    if (ball.y -ball.radio < 0 ) {
      ball.speedBallY = -ball.speedBallY;
      ball.y=ball.radio;
    }
    if (paddle.y <ball.y+ball.radio &&  paddle.x < ball.x && paddle.x+paddle.ancho>ball.x ) {
      ball.speedBallY = -ball.speedBallY;
      velo(paddle.x, paddle.ancho);
      ball.y=paddle.y-ball.radio;
    }
    //if (ball.y-ball.radio > paddle.y) {
    //  int s;
    //  s =(ball.speedBallX>0)? 1 : 0;
    //  ball.init();
    //  ball.speedBallX = (s==1)? ball.speedBallX : -1 * ball.speedBallX;
    //  int j= millis();
    //  while (millis()<j+800) {
    //  }
    //}
    ball.x +=ball.speedBallX;
    ball.y +=ball.speedBallY;
  }
  @Override
    void velo(int a, int b) {
    int c = ball.x-(a+(b/2));
    int s=b/10;
    if (c<0) {
      c=abs(c);
      if (c>s && c<(3*s)) {
        ball.speedBallX -=1 ;
      } 
      if (c>3*s) {
        ball.speedBallX -=2 ;
      }
    } else {
      if (c>s && c<3*s) {
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
          score(blockArray[i][j].score);
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
