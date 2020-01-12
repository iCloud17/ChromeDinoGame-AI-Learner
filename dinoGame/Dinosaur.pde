class Dinosaur{
  PVector velocity;
  PVector pos;
  PVector benchmark;
  float gravity = 1;
  //float maxJump = -21;    JUMP OVER MIDDLE LEVEL BIRD
  float maxJump = -19.7;
  float minJump = -5.5;
  float ht = 140;
  float wd = 100;
  float startingPosX = 80;
  float startingPosY;
  boolean onGround = true;
  boolean ducked;
  boolean dead;
  double fitness = 0.0;
  Brain brain;
  float moveCount = 0.0;
  float obV = 0;
  int choice = 0, oldchoice = 0;
  int nextOb = 0, afternext = 0, oldnext = 0;
  boolean obCleared = false, firstTime = true;
  int id, generation;
 //----------------------------CONSTRUCTOR-------------------------------------------- 
  Dinosaur(int uid) {
    dead = false;
    brain = new Brain();
    startingPosY = height-(ht + gd.ht);
    pos = new PVector(startingPosX,startingPosY);
    velocity = new PVector(0,0);
    benchmark = new PVector(0,0);
    benchmark.add(pos);
    benchmark.add(0,-10);
    fitness = 0;
    id = uid;
    generation = 0;
  }
  //--------------------------------SHOW----------------------------------------------
  void show() {
    fill(130);
    rect(pos.x,pos.y,wd,ht);
    if(onGround) {
      if(ducked) {
        if(foot == 0) {
          image(dinoDuck, pos.x, pos.y, wd, ht);
        } else
          image(dinoDuck1, pos.x, pos.y, wd, ht);
      } else {
        if(foot == 0) {
          image(dinoRun1, pos.x, pos.y, wd, ht);
        } else
          image(dinoRun2, pos.x, pos.y, wd, ht);
      }
    } else
      image(dinoJump, pos.x, pos.y, wd, ht);
      
  }
  //-----------------------------HIGH JUMP-----------------------------------------
  void highjump() {
    stand();
    if(pos.y+ht == gd.pos.y && !ducked && !dead) {
      onGround = false;
      velocity.y = maxJump;
      pos.add(velocity);
    }
  }
  //------------------------------LOW JUMP------------------------------------------
  void lowjump() {
    stand();
    if((pos.y+ht) < gd.pos.y && (pos.y+ht) > (benchmark.y-20) && !ducked && !dead)  {
      velocity.y -= minJump;
      pos.add(velocity);
    }
  }
  //-------------------------------UPDATE--------------------------------------------
  void update() {
    if(!pause && !dead) {
      isDead();
      look();
      if(onGround) {
        brain.think();
        doSomething();
      }
      if((pos.y+ht) < gd.pos.y) {
        velocity.y += gravity;
      }
      else {
        velocity.y = 0;   
        onGround = true;
      }
      pos.add(velocity);
      if((pos.y+ht) > gd.pos.y) {
        pos.y = gd.pos.y - ht;
      }
    }
  }
  //-------------------------------DUCK---------------------------------------------
  void duck() {
    if(!ducked && onGround && !dead && !pause) {
      ducked = true;
      float temp = wd-10;
      wd = ht;
      ht = temp;
      startingPosY = gd.pos.y - ht;
      pos = new PVector(startingPosX, startingPosY);
    }
  }
  //------------------------------STAND---------------------------------------------
  void stand() {
    if(onGround && ducked && !dead && !pause) {
      ducked = false;
      float temp = wd;
      wd = ht+10;
      ht = temp;
      startingPosY = gd.pos.y - ht;
      pos = new PVector(startingPosX, startingPosY);
    }
  }
  //--------------------------------DEAD-------------------------------------------
  
  void isDead() {
    for(int i = 0; i < obstacles.size() && i < 10 && !dead; i++) {
     dead = obstacles.get(i).collided(pos.x, pos.y, wd, ht);
    }
    if(dead) {
      dinosAlive--;
      //brain.feedback(choice, 2);
      //printWeights();
      //pause = true;
      calculateFitness();
      allDead = pop.areAllDead();
    }
  }
  
  
  //--------------------------------LOOK----------------------------------------------
  
  void look() {
    
    
    if(obstacles.size() == 0) {
      brain.ip[0] = 0;    //BirdHeight
      brain.ip[1] = 1000;  //Distance to next Obstacle
      brain.ip[2] = 1000;  //Gap Between Obstacles
      brain.ip[3] = 0;  //Width of Next Obstacle
      brain.ip[4] = 0;  //Height of next Obstacle
    } else {
      for(int i = 0; i < obstacles.size(); i++) {                    //Recognize Next Challenging Obstacle
         if(pos.x < (obstacles.get(i).posX + obstacles.get(i).wd) ) {
           oldnext = nextOb;
           nextOb = i;
           afternext = i + 1;
           //println("Oldnext = " + oldnext + "nextOb = " + nextOb);
           break;
         }
      }
      
      if(oldnext != nextOb) {
        obV+=1;
        obCleared = true;       
      }
      
      brain.ip[1] = (obstacles.get(nextOb).posX - pos.x);
      brain.ip[3] = obstacles.get(nextOb).wd;
      brain.ip[4] = (gd.pos.y - obstacles.get(nextOb).posY);
      if((afternext+1) < obstacles.size())
        brain.ip[2] = (obstacles.get(afternext).posX - obstacles.get(nextOb).posX);
      else
        brain.ip[2] = 1000;
      
      if(obstacles.get(nextOb).type == 3)
        brain.ip[0] = (gd.pos.y - obstacles.get(nextOb).posY);
      else
        brain.ip[0] = 0;
    }
    
    brain.ip[5] = (gd.pos.y - (pos.y + ht));  //Current Y Position
    brain.ip[6] = speed;
 
  }
  
  //------------------------------------------DOSOMETHING---------------------------------
  
  void doSomething() {
     /*if(obCleared && !firstTime) {
       obCleared = false;
       obV++;
       //brain.feedback(choice, 1);
     } else if(choice != 0){
       brain.feedback(choice, 3);
       //brain.feedback(0, 1);
     } */
     choice = 0;
     for(int i = 1; i < opl; i++) {
        if(brain.op[i] > brain.op[choice])
           choice = i;
     }
     
     switch(choice) {
        case 0: if(!ducked && choice != oldchoice)
                  moveCount -= 1;
                stand();
                break;
        case 1: moveCount+=1.2;
                highjump();
                break;
        case 2: moveCount+=1;
                lowjump();
                break;
        case 3: if(choice != oldchoice || firstTime)
                  moveCount+=1;
                duck();
                break;                
       
     }
     oldchoice = choice;
     firstTime = false;
     /*if(oldchoice == choice && !dead && oldObV == obstaclesConquered) {
      if(choice != 0)
        brain.penalizeChoice(choice);
      else
        brain.rewardChoice(choice);
     }
      
     if(!dead && oldObV < obstaclesConquered && oldchoice!=choice)
       brain.rewardChoice(choice);
     
     oldchoice = choice; */
  }
  
  
  //--------------------------------------------FITNESS------------------------------------
  
  void calculateFitness() {
     if(moveCount == 0)
       moveCount = 1;
     /*if(gen - regressionFactor < 0)
       moveCount = -1 * moveCount; */
       //println(obV);
     if(obV == 0)
       fitness = 0;
     else {
       fitness = ((pow(2, ((obV-(gen/5))/100)) / (moveCount)) + (score/50) + extraReward)/10000;
     }
     //fitness = (((obV * obV) / moveCount) * extraReward) + (score/50); //* score / (moveCount * (gen-regressionFactor) * 0.1);
     //fitness = ((score * score) / (moveCount * 10000)) * extraReward;
     //println(fitness);
  }
  
  //-------------------------------------------MUTATE to TARGET--------------------------------
  //Not dead after taking action? Backpropogate by adding reward.....if dies then add penalty
  void mutateTarget2(Dinosaur x, Dinosaur y) {
    float bar;
    for(int i = 0; i < hd1; i++) {
       for(int j = 0; j < ipl+1; j++) {
         bar = random(1);
         if(bar < (0.001 + regressionFactor/20.0))
           brain.layer1weights[i][j] = random(-5,5);
         else if(bar < 0.5) {
           brain.layer1weights[i][j] = y.brain.layer1weights[i][j];
         }
         else
           brain.layer1weights[i][j] = x.brain.layer1weights[i][j];
       }
    }
    
    for(int i = 0; i < hd2; i++) {
       for(int j = 0; j < hd1+1; j++) {
         bar = random(1);
         if(bar < (0.001 + regressionFactor/20.0))
           brain.layer2weights[i][j] = random(-5,5);
         else if(bar < 0.5) {
           brain.layer2weights[i][j] = y.brain.layer2weights[i][j];
         }
         else
           brain.layer2weights[i][j] = x.brain.layer2weights[i][j];
       }
    }
    int lim = 0;
    if(hd2 != 0)
      lim = hd2 + 1;
    else
      lim = hd1 + 1;
    for(int i = 0; i < opl; i++) {
       for(int j = 0; j < lim; j++) {
         bar = random(1);
         if(bar < (0.001 +(float) regressionFactor/20))
           brain.layer3weights[i][j] = random(-5,5);
         else if(bar < 0.5) {
           brain.layer3weights[i][j] = y.brain.layer3weights[i][j];
         }
         else
           brain.layer3weights[i][j] = x.brain.layer3weights[i][j];
       }
    }
  }
  
  //-------------------------------------------MUTATE to TARGET--------------------------------
  //Not dead after taking action? Backpropogate by adding reward.....if dies then add penalty
  void mutateTarget1(Dinosaur x) {
    float bar;
    for(int i = 0; i < hd1; i++) {
       for(int j = 0; j < ipl + 1; j++) {
         bar = random(1);
         if(bar < (0.001 + regressionFactor/20.0))
           brain.layer1weights[i][j] = random(-5,5);
         else if(bar < 0.5) {
           brain.layer1weights[i][j] = x.brain.layer1weights[i][j];
         }
       }
    }
    
    for(int i = 0; i < hd2; i++) {
       for(int j = 0; j < hd1+1; j++) {
         bar = random(1);
         if(bar < (0.001 + regressionFactor/20.0))
           brain.layer2weights[i][j] = random(-5,5);
         else if(bar < 0.5) {
           brain.layer2weights[i][j] = x.brain.layer2weights[i][j];
         }
       }
    }
    
    int lim = 0;
    if(hd2 != 0)
      lim = hd2 + 1;
    else
      lim = hd1 + 1;
    for(int i = 0; i < opl; i++) {
       for(int j = 0; j < lim; j++) {
         bar = random(1);
         if(bar < (0.001 +(float) regressionFactor/20))
           brain.layer3weights[i][j] = random(-5,5);
         else if(bar < 0.5) {
           brain.layer3weights[i][j] = x.brain.layer3weights[i][j];
         }
       }
    }
  }
 
 
 //--------------------------------------GET BABY----------------------------------------
 /*
 Dinosaur gimmeBaby() {
    Dinosaur baby = new Dinosaur();
    baby.brain = brain.clone();
    return baby;
 } 
 */
 
 //--------------------------------------GET BABY----------------------------------------
 
 Dinosaur giveBaby(Dinosaur d) {
    d.brain = brain.clone();
    d.fitness = fitness;
    return d;
 }
 
 //--------------------------------------------------------------------------------------
 
 void reset() {
    dead = false;
    ht = 140;
    wd = 100;
    startingPosX = 80;
    startingPosY = height-(ht + gd.ht);
    pos = new PVector(startingPosX,startingPosY);
    velocity = new PVector(0,0);
    benchmark = new PVector(0,0);
    benchmark.add(pos);
    benchmark.add(0,-10);
    fitness = 0.0;
    moveCount = 0.0;
    choice = 0; 
    oldchoice = 0;
    obV = 0.0;
    onGround = true;
    ducked = false;
    firstTime = true;
 }
 
 //---------------------------------------------------------------

  void printWeights() {
    if(best>=0) {
      for(int i = 0; i < hd1; i++) {
         for(int j = 0; j < ipl+1; j++) {
           println("layer1weights[" + i + "]" + "[" + j + "] = " + brain.layer1weights[i][j] + ";");
         }
      }
      
      for(int i = 0; i < hd2; i++) {
         for(int j = 0; j < hd1+1; j++) {
           println("layer2weights[" + i + "]" + "[" + j + "] = " + brain.layer2weights[i][j] + ";");
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
           println(str + i + "]" + "[" + j + "] = " + brain.layer3weights[i][j] + ";");
         }
      }
    }
  }
}
