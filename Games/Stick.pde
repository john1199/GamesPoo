class Stick {
  int ancho, largo, x, y;

  public Stick() {
    ancho = 200;
    largo = 30;
    x = 680;
    y = height-40;
  }
  void createStick() {
    fill(0);
    rect(x, y, ancho, largo);
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
