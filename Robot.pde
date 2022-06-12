class Robot extends Enemy {
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  int coolDownTimer=0;
  float speed = 2f;
  
  float currentX;
  Laser laser;
  
  Robot(float x, float y) {
    super(x, y);
  }
  
  void display(){
    pushMatrix();
    translate(x,y);
    if (speed > 0) {
      scale(1, 1);
      image(robot, 0, 0, w, h); 
    } 
    if (speed < 0) {
      scale(-1, 1);
      image(robot, -w, 0, w, h); 
    }
    popMatrix();
  }
  
  void update(){
    /*if( x >= width-80 || x<=0) speed*=-1;
    if (coolDownTimer == 0) {
      if(abs(player.y- this.y)/SOIL_SIZE 
      <= PLAYER_DETECT_RANGE_ROW 
      && this.x<player.x){//right
        laser.fire(x+HAND_OFFSET_X_FORWARD, y+HAND_OFFSET_Y, player.x+SOIL_SIZE/2, player.y+SOIL_SIZE/2);
      }
      if(abs(player.y- this.y)/SOIL_SIZE 
      <= PLAYER_DETECT_RANGE_ROW 
      && this.x>player.x){//left
        laser.fire(x+HAND_OFFSET_X_BACKWARD, y+HAND_OFFSET_Y, player.x+SOIL_SIZE/2, player.y+SOIL_SIZE/2);
      }
    }else{
      
      x += speed;
    }
    
    if(coolDownTimer >= 0){
      coolDownTimer--;
    }
      x += speed;
      if (x >= width-SOIL_SIZE||x<=0) speed*=-1;*/
    
    
    if(abs(player.y- this.y)/SOIL_SIZE 
      <= PLAYER_DETECT_RANGE_ROW 
      && this.x<player.x){//right
      x = currentX;
    }
    if(abs(player.y- this.y)/SOIL_SIZE 
      <= PLAYER_DETECT_RANGE_ROW 
      && this.x>player.x){//left
      x = currentX;
    }
    
    x += speed;
    currentX = x;
    println(speed);
    if (x >= width-SOIL_SIZE||x<=0) speed*=-1;
    
    
  }
  
  void checkCollision(Player player){
    laser = new Laser();
    super.checkCollision(player);
    laser.checkCollision(player);
  }
  
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
