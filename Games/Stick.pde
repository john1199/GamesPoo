class Stick {
  int ancho, largo, x, y;

  public Stick() {
    ancho = 15;
    largo = 200;
    x = (width/2)-(ancho/2);
    y = height-40;
  }
  void createStick() {
    fill(random(255),random(255),random(255));
    rect(x, y, largo, ancho);
  }
  void drawStick() {
    createStick();
    update();
  }
  void update() {
    if (keyPressed) {
      if (keyCode == LEFT && x > 0) {
        x -= 10;
      }
      if (keyCode == RIGHT && x < width-200) {
        x += 10;
      }
    }
  }
}
