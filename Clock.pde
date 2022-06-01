class Clock extends Item {
  // Requirement #2: Complete Clock Class
  //int []clockX = new int[6];
  //int []clockY = new int[6];
  Clock(float x, float y) {
    super(x, y);
  }

  //Code for Reference:

  // Display Clock
  void display() {
    if (isAlive == true) {
      //for (int i = 0; i < clockX.length; i++) {
        // Display Cabbage
        image(clock, x, y);
      //}
    }
  }

  // Check collision with player
  void checkCollision(Player player) {
    //for (int i = 0; i < clockX.length; i++) {
      
      if (isHit(x, y, w, h, player.x, player.y, player.w, player.h) && isAlive == true ) {
        
        addTime(CLOCK_BONUS_SECONDS);
        isAlive = false;
        //clockX[i] = clockY[i] = -1000; // Now that they're objects, toggle isAlive instead of throwing them away from screen
      }
      
    //}
  }
  
}
