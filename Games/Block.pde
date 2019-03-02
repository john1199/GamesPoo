class Block {
  int x, y, ancho;
  boolean[] blocks;
  int numBlocksX, numBlocksY;

  public Block(int _numBlocksX, int _numBlocksY) {
    numBlocksX = _numBlocksX;
    numBlocksY = _numBlocksY;
    x = 20;
    y = 20;
    ancho = 20;
    blocks = new boolean[numBlocksX];
  }
  void createBlocks(int x, int y, int largo, int ancho) {
    //Draw one
    rect(x, y, largo, ancho);

    //Draw with Array
    //for (int i =0; i<numBlocks; i++) {
    //  blocks[i] = true;
    //}
  }

  void drawBlock() {
    int largo = (width)/numBlocksX;
    for (int j = y; j<height/2; j+=50) {
      for (int i = 0; i<numBlocksX; i++) {
        println(height/numBlocksY);
        if (i == 0) {
          createBlocks(10, j, largo-20, ancho);
        } else if (i > 0) {
          createBlocks(largo*i, j, largo-10, ancho);
        } else {
          break;
        }
      }
    }
  }
}
