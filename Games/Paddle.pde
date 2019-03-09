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
      if (y < ball.y+ball.radio &&  x < ball.x && (x+ancho)>ball.x ) {
        ball.speedBallY = -ball.speedBallY;
      }
    }
  }
