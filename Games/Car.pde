class Car extends StatusGame {
  float x, y, k; // coordenadas del centro de las rocas
  float n, plus, v, plus2; // usada para el noise
  float velocidad, velocidady; // velocidades en x e y
  boolean vivo; // saber si el jugador siguie vivo
  int score; //puntos
  Carro carrito;//carrito
  //constructor
  public Car() {
    velocidad = -15;
    velocidady = 20;
    carrito = new Carro();
    k = random(10, 80);
    x = width;
    y = 100;
    k=50;
    n = 0.0;
    v = 0.0;
    plus = 0.15;
    plus2 = 0.09;
    vivo = true;
    score = 0;
  }
  @Override
    void loser() {
    if (vivo == false) {
      text("Game over", (width/2)-((width/2)/4), height/2);
    }
    //restart();
  }
  //genera las rocas y las mueve
  @Override
    void update() {
    //radio aleatorio
    //k = random(10,80);
    //crea las rocas
    //noStroke();
    fill(180);
    //altua aleatoria
    float p = y + noise(n)*(height-2*k);
    constrain(p, 0, height);
    ellipse(x, p, k, k);
    //rebote arriba y abajo
    if (p - k <= 0 || p + k >= height) {
      velocidady *= -1;
    }
    //desplazamiento en función de la velocidad
    y += velocidady;
    x += velocidad;
    //genera rocas nuevas
    if (x-k < 0 && vivo==true) {
      x = width;
      n += plus;
      score++;
    }
    //choque de las rocas y el auto
    if (carrito.y1 <= p+k && p-k <= carrito.y3+carrito.t && 0 < x && x < carrito.x4+carrito.t) {
      score = 0;
      vivo = false;
    }
  }
  @Override
    void velo(int a, int b) {
  }
  @Override
    void restart() {
    carrito.dibujar();
    loser();
    update();
    vivo = true;
  }
  @Override
    void score(int a) {
  }
  @Override
    void displayScore() {
  }
  //junta todo lo del juego
  @Override
    void gamePlay() {
    // el jugador pierde
    // aquí el jugador sigue vivo
    if (vivo) {
      carrito.dibujar();
      int i = 0;
      update();
      //dificultad dependiente del límite del while (NO TOCAR)
      while (i<1) {
        update();
        i++;
      }
      //loser();
    }

    keyPressed();
    loser(); 
    textSize(100);
    text(score, 100, 100);
  }
  void keyPressed() {
    if (key == '0') {
      state = 0;
    }
  }
}
