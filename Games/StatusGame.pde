abstract class StatusGame{
  boolean restart;
  int score=0,level;
  
  public StatusGame(){
   restart = false;
   score  = 0;
   level  = 1;
  }
  void score(int n){
    score = n;
  }
  int level(){
    return 1;
  }
  abstract void displayScore();
  abstract void gamePlay();
  abstract void loser();
  abstract void restart();
  
}
