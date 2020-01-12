class Obstacle {
  float posX;
  float posY;
  float wd;
  float ht;
  int type;
  int wingFrameCount = 0;
  int wing = 0;
  int birdType = 0;
  Obstacle() {
    if(enableBirds)
      type = floor(random(4));
    else
      type = floor(random(3));     
    //type = 3;
    switch(type) {
      case 0: //BIG CACTUS
              wd = 50;
              ht = 120;
              break;
      case 1: //SMALL CACTUS
              wd = 40;
              ht = 80;
              break;
      case 2: //SMALL CACTI
              wd = 120;
              ht = 80;
              break;
      case 3: //BIRD
              wd = 100;
              ht = 60;
              birdType = floor(random(3));
              switch(birdType) {
                case 0:case 3: //LOW HEIGHT
                        posY = gd.pos.y - ht;
                        break;
                case 1: //MEDIUM HEIGHT
                        posY = gd.pos.y - (2.7*ht);
                        break;
                case 2: //HIGH HEIGHT
                        posY = gd.pos.y - (4.5*ht);
                        break;
              }
              break;
              
    }
    posX = width-wd;
    if(type != 3)
      posY = gd.pos.y - ht;
  }
  
  void show() {
    fill(130);
    rect(posX, posY, wd, ht);
    switch(type) {
    case 0:
      image(bigCactus, posX, posY, wd, ht);
      break;
    case 1:
      image(smallCactus, posX, posY, wd, ht);
      break;
    case 2:
      image(manySmallCactus, posX, posY, wd, ht);
      break;
    case 3:
      if(wing == 0)
        image(bird, posX, posY, wd, ht);
      else
        image(bird1, posX, posY, wd, ht);
      if(wingFrameCount == 0 && !allDead)
        wing = 1 - wing;
      if(!pause && !allDead)
        wingFrameCount = (++wingFrameCount)%9;
      break;
    }
  }
  
  void move(float speed) {
    posX -= speed;
  }
  
  boolean collided(float playerX, float playerY, float playerWidth, float playerHeight) {

    float playerLeft = playerX;
    float playerRight = playerX + playerWidth;
    float thisLeft = posX;
    float thisRight = posX + wd;
    float playerUp = playerY;
    float playerDown = playerY + playerHeight;
    float thisUp = posY;
    float thisDown = posY + ht;
    /*if( (playerRight >= thisLeft && playerRight <=thisRight) && (playerUp >= thisUp && playerUp <= thisDown) ) {
      print("-------------------------4-------------------------------------\n"); 
      return true; 
    }
    if( (playerLeft >= thisLeft && playerLeft <=thisRight) && (playerDown >= thisUp && playerDown <= thisDown) ) {
      print("-------------------------1-------------------------------------\n"); 
      return true; 
    }
    if( (playerRight >= thisLeft && playerRight <=thisRight) && (playerDown >= thisUp && playerDown <= thisDown) ) {
      print("-------------------------2-------------------------------------\n"); 
      return true; 
    }
    if( (playerLeft >= thisLeft && playerLeft <=thisRight) && (playerUp >= thisUp && playerUp <= thisDown) ) {
      print("-------------------------3-------------------------------------\n"); 
      return true; 
    }*/
    
    if ( ((playerLeft >= thisLeft && playerLeft <=thisRight) || (playerRight >= thisLeft && playerRight <=thisRight)) && ((playerDown >= thisUp && playerDown <= thisDown) || (playerUp <= thisDown && playerUp >= thisUp) || (playerUp <= thisUp && playerDown >= thisDown) ) )
      return true;
    return false;
  }
  
}
