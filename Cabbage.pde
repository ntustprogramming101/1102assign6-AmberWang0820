class Cabbage extends Item {
  // Requirement #1: Complete Cabbage Class
  int []cabbageX = new int[6];
  int []cabbageY = new int[6];
  
  Cabbage(float x, float y){
    super(x,y);
    
  }
  
  //Code for Reference:
  void display() {
    if(isAlive == true){
      for (int i = 0; i < cabbageX.length; i++) {
        // Display Cabbage
        image(cabbage, cabbageX[i], cabbageY[i]);
      }
    }
    
  }

  // Check collision with player
  void checkCollision(Player player) {
    for (int i = 0; i < cabbageX.length; i++) {
      if (player.health < player.PLAYER_MAX_HEALTH
        && isHit(cabbageX[i], cabbageY[i], w, h, player.x, player.y, player.w, player.h)
        && isAlive == true) {
  
        player.health ++;
        isAlive = false;
        //cabbageX[i] = cabbageY[i] = -1000; // Now that they're objects, toggle isAlive instead of throwing them away from screen
      }
    }
    
  }
}
