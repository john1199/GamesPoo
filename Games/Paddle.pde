//sprites
class Paddle {
  int ancho, largo, x, y;

  public Paddle() {
    largo = height/20;
    ancho= width/5;
    x = (width/2)-(ancho/2);
    y = height-100;
  }
  public Paddle(int _x, int _y, int _ancho, int _largo) {
    ancho = _ancho;
    largo = _largo;
    x = _x;
    y = _y;
  }
  void createPaddle() {
    rect(x, y, ancho, largo);
  }
  void drawPaddle(color n) {
    fill(n);
    createPaddle();
  }
  void update(int tecla1, int tecla2, char var) {
    int v=height/100;
    if (var == 'x') {      
      if (keyPressed) {
        if (k == tecla1 && x > 0) {
          x-=v;
        }  
        if (k == tecla2 && x < width-ancho) {
          x+=v;
        }
      }
    } else if (var == 'y') {
      if (keyPressed) {
        if (k == tecla1 && y > 0 ) {
          y-=v;
        }
        if (k == tecla2 && y < height-largo) {
          y+=v;
        }
      }
    }
  }
  void checkCollides(Ball ball) {
    int ballPositionX = ball.x;
    int ballPositionY = ball.y;
    if ( x < ballPositionX && (x+ancho) > ballPositionX && y < ballPositionY && y+largo > ballPositionY) {
      ball.speedBallY = -ball.speedBallY;
    }
    //if ( ballPositionX > (y-ancho)+3 && ballPositionX < (y-ancho)-3 && ballPositionX > ((x+largo)-ancho)-3 && ballPositionX < ((x+largo)-ancho)-3){
    //  ball.speedBallY = -ball.speedBallY;
    //}
  }
}
