abstract class StatusGame{
  boolean restart;
  int score=0,level;
  
  public StatusGame(){
   restart = false;
   score  = 0;
   level  = 1;
  }
  
  abstract void displayScore();
  abstract void score(int n);
  abstract void gamePlay();
  abstract void loser();
  abstract void update();  
  abstract void velo(int a,int b);
  abstract void restart();
  
}
