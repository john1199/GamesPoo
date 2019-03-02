class Block {
  int x, y, ancho, largo;
  int numBlocksX, numBlocksY;
  boolean status;
  
  public Block() {
    status = true;
    x = 0;
    ancho = 20;
  }
  
  void createBlocks(int x, int y, int largo, int ancho) {
    //Draw one
    status = true;
    rect(x, y, largo, ancho);
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
