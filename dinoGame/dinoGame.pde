//Dinosaur dino;
Dinosaur lastBest;
Dinosaur currentDino;
Population pop;
Ground gd;
float starttime, endtime, time;
PImage dinoRun1;
PImage dinoRun2;
PImage dinoJump;
PImage dinoDuck;
PImage dinoDuck1;
PImage smallCactus;
PImage manySmallCactus;
PImage bigCactus;
PImage bird;
PImage bird1;

float score = 0;
int ipl = 7, hd1 = 6, hd2 = 5, opl = 4;
int lastScore = 0;
int bestScore = 0;
int best = 0;
int second = 0;
int gen = 1;
int limit = 3;
int footFrameCount = 0;
float minWaitTime = 50;
float waitTime = 0;
int randomAddedTime;
float randomFactor = 80;
float speed = 10;
int obstaclesConquered = 0;
int birdThreshold = 0;
float incrSpeed = 0.2;
float decrMin = 1;
float decrRandom = 1;
int foot;
int frameSpeed = 60;
int popNum = 10000;
float checkPointMarker = 150;
float bestMarker = 1000;
float extraReward = 0;
float bestBonus = 2;
int dinosAlive = popNum;
float regressionFactor = 0;
int rgrcnt = 1;
float reward = 0.1;
float penalty = 0.3;

boolean pause;
boolean enableBirds;
boolean allDead;
boolean improved;

ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
//---------------------------SETUP-------------------------------------
void setup() {
  starttime = 0;
  endtime = 0;
  pause = false;
  enableBirds = false;
  allDead = false;
  improved = false;
  randomAddedTime = floor(random(randomFactor));
  size(1500,500);
  gd = new Ground();
  //dino = new Dinosaur();
  lastBest = new Dinosaur(-1);
  currentDino = new Dinosaur(-2);
  pop = new Population(popNum);
  dinoRun1 = loadImage("dinorun0000.png");
  dinoRun2 = loadImage("dinorun0001.png");
  dinoJump = loadImage("dinoJump0000.png");
  dinoDuck = loadImage("dinoduck0000.png");
  dinoDuck1 = loadImage("dinoduck0001.png");
  smallCactus = loadImage("cactusSmall0000.png");
  bigCactus = loadImage("cactusBig0000.png");
  manySmallCactus = loadImage("cactusSmallMany0000.png");
  bird = loadImage("berd.png");
  bird1 = loadImage("berd2.png");
  frameRate(frameSpeed);
  //printWeights();
}
//-------------------------------DRAW--------------------------------
void draw() {
  background(255);
  footFrameCount++;
  showObstacles();
  pop.show();
  gd.show();
  text("Generation: " + gen, 80, gd.pos.y + 60);
  text("Alive: " + dinosAlive, 300, gd.pos.y + 60);
  text("Best Score: " + bestScore, width - 530, gd.pos.y + 60);
  text("Last Score: " + lastScore, width - 330, gd.pos.y + 60);
  text("Score: " + int(score), width - 130, gd.pos.y + 60);
  textSize(20);
  if(!pause && !allDead) {
    if(score > bestMarker) {
      bestBonus *= 2;
      bestMarker += 1000;
    }
    if(score > checkPointMarker) {
       checkPointMarker *= 1.5;
       extraReward += 50;
     }
    waitTime++;
    if(waitTime % 3 == 0)
      score++;
    if(waitTime > (minWaitTime + randomAddedTime)) {
      addObstacles();
    }
    pop.update();
    updateObstacles();
  } else if(!pause){
    println("\n----------------GENERATION " + gen + "----------------");
    if(score > bestScore) {
      println(bestScore + "   IMPROVING!   " + score);
      improved = true;
      regressionFactor = 0;
      rgrcnt = 1;
      bestScore = int(score);
    }
    else if(score == bestScore) {
      println(bestScore + "   SAME!   " + score);
      improved = true;
    }
    else {
      println(bestScore + "   REGRESSING " + rgrcnt + " !   " + score);
      rgrcnt++;
      regressionFactor += 1;
    }
    checkPointMarker = 150;
    extraReward = 0;
    pop.naturalSelection();
    if(improved)
      pop.dino[best].printWeights();
    bestMarker = 1000;
    bestBonus = 2;
    improved = false;
    obstacles = new ArrayList<Obstacle>();
    waitTime = 0;
    enableBirds = false;
    obstaclesConquered = 0;
    speed = 10;
    lastScore = int(score);
    score = 0;
    minWaitTime = 50;
    randomFactor = 80;
    allDead = false;
    dinosAlive = popNum;
  }
  
}
//----------------------------KEY PRESSED----------------------------
void keyPressed() {
  /*if(key == ' ' || (key == CODED && keyCode == UP)) {
    starttime = millis();
    dino.highjump();
  }
  
  if(key == CODED && keyCode == DOWN) {
    //System.out.println("coded");
    //System.out.println("DOWN");
    dino.duck();
  }*/
  
  if(key == 'p' || key == 'P') {
    if(pause)
      pause = false;
    else
      pause = true;
  }
  
  if(key == 'c' || key == 'C') {
    println("\n----------------GENERATION " + currentDino.generation + "----------------\n");
    currentDino.printWeights();
  }
  
  if(key == 's' || key == 'S') {
    println("\n----------------GENERATION " + lastBest.generation + "----------------\n");
    lastBest.printWeights();
  }
  
  /*if((key == 'r' || key == 'R') && allDead) {
    restartGame();
  }*/
}
//--------------------------KEY RELEASED-----------------------------
void keyReleased() {
  /*if(key == ' ' || (key == CODED && keyCode == UP)) {
    endtime = millis();
    time = endtime - starttime;
    //System.out.println("STARTTIME: " + starttime + " ENDTIME: " + endtime + " TIME: " + time);
    if(time <= 110) {
      dino.lowjump();
    }
  }
  
  if(key == CODED && keyCode == DOWN) {
    dino.stand();
  }*/
}
//-----------------------------OBSTACLES---------------------------
void addObstacles() {
   waitTime = 0;
   randomAddedTime = floor(random(randomFactor));
   Obstacle ob = new Obstacle();
   obstacles.add(ob);   
   //System.out.println("ADD OBSTACLE");
}

void showObstacles() {
   for(int i = 0; i < obstacles.size(); i++) {
     obstacles.get(i).show();
   }
   //System.out.println("SHOW OBSTACLE");
}

void updateObstacles() {
  for(int i = 0; i < obstacles.size(); i++) {
     obstacles.get(i).move(speed);
     if ((obstacles.get(i).posX + obstacles.get(i).wd) <= 0) { 
      obstacles.remove(i);
      i--;
      if(!enableBirds) {
        obstaclesConquered++;
        if(obstaclesConquered > birdThreshold) 
          enableBirds = true;
      }
      speed += incrSpeed;
      randomFactor -= decrRandom;
      minWaitTime -= decrMin;
      if(randomFactor == 40)
        decrRandom = 0;
      if(minWaitTime == 32)
        decrMin = 0;
    }
   }
   //System.out.println("UPDATE OBSTACLE");
}

//--------------------------RESTART-------------------------------

void restartGame() {
  pop = new Population(popNum);
  obstacles = new ArrayList<Obstacle>();
  waitTime = 0;
  enableBirds = false;
  obstaclesConquered = 0;
  speed = 10;
  score = 0;
  minWaitTime = 60;
  randomFactor = 60;
  allDead = false;
}

/*---------------------------------------------------------------

void printBestWeights() {
  if(best>=0) {
    for(int i = 0; i < hd1; i++) {
       for(int j = 0; j < ipl+1; j++) {
         println("layer1weights[" + i + "]" + "[" + j + "] = " + pop.dino[best].brain.layer1weights[i][j] + ";");
       }
    }
    
    for(int i = 0; i < hd2; i++) {
       for(int j = 0; j < hd1+1; j++) {
         println("layer2weights[" + i + "]" + "[" + j + "] = " + pop.dino[best].brain.layer2weights[i][j] + ";");
       }
    }
    String str = "";
    int lim = 0;
    if(hd2 != 0) {
     str = "layer3weights[";
     lim = hd2 + 1;
    } else {
      str = "layer2weights[";
      lim = hd1 + 1;
    }
    for(int i = 0; i < opl; i++) {
       for(int j = 0; j < lim; j++) {
         println(str + i + "]" + "[" + j + "] = " + pop.dino[best].brain.layer3weights[i][j] + ";");
       }
    }
  } 
} */

    
