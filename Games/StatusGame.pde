abstract class StatusGame{
  boolean restart;
  int score,level;
  
  public StatusGame(){
   restart = false;
   score  = 0;
   level  = 1;
  }
  int score(){
    return 1;
  }
  int level(){
    return 1;
  }
  abstract void displayScore();
  abstract void loser();
  abstract void restart();
  
}
