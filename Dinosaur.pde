class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed = 1f;
  final float ORIGINAL_SPEED = 1f;
  
  Dinosaur(float x,float y){
    super(x,y);
  }
  
  void display(){
    
    pushMatrix();
    translate(x, y);
    if (speed > 0) {
      scale(1, 1);
      image(dinosaur, 0, 0, w, h); 
    } 
    if (speed < 0) {
      scale(-1, 1);
      image(dinosaur, -w, 0, w, h); 
    }
    popMatrix(); 
    
   }
  
  void update(){
    if(player.y==this.y && speed>0 && this.x<player.x){//right side
      speed = ORIGINAL_SPEED*TRIGGERED_SPEED_MULTIPLIER;
      x += speed;
    }else if(speed==5 && player.y!=this.y ){
      speed = ORIGINAL_SPEED;
    }
    
    if(player.y==this.y && speed<0 && this.x>player.x){//left side
      speed = ORIGINAL_SPEED*TRIGGERED_SPEED_MULTIPLIER*-1;
      x += speed;
    }else if(speed==-5 && player.y!=this.y ){
      speed = ORIGINAL_SPEED*-1;
    }
    
    //println(speed);
    x += speed;
    if(x >= width-SOIL_SIZE || x<=0) speed*=-1;
  }
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
