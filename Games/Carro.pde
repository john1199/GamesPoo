class Carro{
  int x1,x2,x3,x4; //variables x del shape_carrito
  int y1,y2,y3;    //variables y del shape_carrito;
  int t;           //tamaño del carro
  
  //Constructor por defecto de la clase Carro
  Carro(){
    t = 50;
    x1 = 10;
    x2 = x1 + t;
    x3 = x2 + t;
    x4 = x3 + t;
    y1 = height/2-t-t/2;
    y2 = y1 + t;
    y3 = y2 + t;
    
  }
  //Dubuja el carro y lo mueve
  void dibujar(){
    if (keyPressed && key == 'w' && y1 > 0){
      y1 -= t;
      y2 = y1 + t;
      y3 = y2 + t;
    }
    if (keyPressed && key == 's' && y3 < height-t) {
     y1 += t;
      y2 = y1 + t;
      y3 = y2 + t;
    }
    strokeWeight(5);
    stroke(0);
    fill(255);
    rect(x1,y1,t,t);
    rect(x1,y3,t,t);
    rect(x2,y2,t,t);
    rect(x3,y1,t,t);
    rect(x3,y2,t,t);
    rect(x3,y3,t,t);
    rect(x4,y2,t,t);
  }
}
