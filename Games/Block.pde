class Block {
  int x, y, ancho, largo;
  boolean status;
  color c;
  
  public Block() {
    status = true;
    ancho = 10;
    c = color(random(255),random(255),random(255));
  }

  //void drawBlock() {
  //  int largo = (width)/numBlocksX;
  //  for (int j = y; j<height/2; j+=50) {
  //    for (int i = 0; i<numBlocksX; i++) {
  //      if (i == 0) {
  //        createBlocks(10, j, largo-20, ancho);
  //      } else if (i > 0) {
  //        createBlocks(largo*i, j, largo-10, ancho);
  //      } else {
  //        break;
  //      }
  //    }
  //  }
  //}
}
