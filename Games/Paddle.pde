//sprites
class Paddle {
  int ancho, largo, x, y;
  color c;
  
  public Paddle() {
    largo = height/20;
    ancho= width/5;
    x = (width/2)-(ancho/2);
    y = height-100;
    c = color(random(255), random(255), random(255));
  }
  public Paddle(int _x, int _y, int _ancho, int _largo) {
    ancho = _ancho;
    largo = _largo;
    x = _x;
    y = _y;
  }
  void createPaddle() {
    fill(c);
    rect(x, y, ancho, largo);
  }
  void drawPaddle() {
    createPaddle();
    //update();
  }

  void update(int tecla1, int tecla2, char var) {

    if (var == 'x') {
      if (keyPressed) {
        if (keyCode == tecla1 && x > 0) {
          x -= 10;
        }
        if (keyCode == tecla2 && x < width-ancho) {
          x += 10;
        }
      }
    } else if (var == 'y') {
      if (keyPressed) {
        if (keyCode == tecla1 && y > 0 || key == tecla1 && y > 0) {
          println(y);
          y -= 10;
        }
        if (key == tecla2 && y < height-largo || keyCode == tecla2 && y < height-largo) {
          println(y);
          y += 10;
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
