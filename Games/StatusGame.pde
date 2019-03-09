abstract class StatusGame{
  boolean restart;
  
  public StatusGame(){
   restart = false;
  }
  
  abstract void displayScore();
  abstract void score(int n);
  abstract void gamePlay();
  abstract void loser();
  abstract void update();  
  abstract void velo(int a,int b);
  abstract void restart();
  
}
