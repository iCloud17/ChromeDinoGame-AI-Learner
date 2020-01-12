class Population {
 int n, undead = 0;
 Dinosaur[] dino;
 //Dinosaur lastBest;
 double fitnessSum = 0;
 int nullCount = 0;
 int bestCount = 0;
 int worstCount = 0;
 int otherCount = 0;
 int worst = 0;
 int oldi = -1;

 Population(int size) {
   n = size;
   dino = new Dinosaur[size];
   //lastBest = new Dinosaur();
   for(int i = 0; i < size; i++) {
      dino[i] = new Dinosaur(i);
   }
   //setupdino();
   currentDino = dino[undead].giveBaby(currentDino);
   currentDino.generation = gen;
 }
 //----------------------------------------SETUP DINO-------------------------------
 
   void setupdino() {
    dino[0].brain.layer1weights[0][0] = 3.41701602935791;
    dino[0].brain.layer1weights[0][1] = -4.183105945587158;
    dino[0].brain.layer1weights[0][2] = -3.790559768676758;
    dino[0].brain.layer1weights[0][3] = -2.784562587738037;
    dino[0].brain.layer1weights[0][4] = -3.7958872318267822;
    dino[0].brain.layer1weights[0][5] = 3.733386993408203;
    dino[0].brain.layer1weights[0][6] = 4.022819519042969;
    dino[0].brain.layer1weights[0][7] = -3.5699100494384766;
    dino[0].brain.layer1weights[1][0] = 2.72927188873291;
    dino[0].brain.layer1weights[1][1] = -1.5047545433044434;
    dino[0].brain.layer1weights[1][2] = 0.8839607238769531;
    dino[0].brain.layer1weights[1][3] = -4.262838840484619;
    dino[0].brain.layer1weights[1][4] = 1.456796646118164;
    dino[0].brain.layer1weights[1][5] = -2.712679386138916;
    dino[0].brain.layer1weights[1][6] = -0.8599715232849121;
    dino[0].brain.layer1weights[1][7] = 2.1105380058288574;
    dino[0].brain.layer1weights[2][0] = -1.4972467422485352;
    dino[0].brain.layer1weights[2][1] = -3.5828793048858643;
    dino[0].brain.layer1weights[2][2] = -2.104447364807129;
    dino[0].brain.layer1weights[2][3] = -3.226168632507324;
    dino[0].brain.layer1weights[2][4] = -4.147996425628662;
    dino[0].brain.layer1weights[2][5] = -2.1887593269348145;
    dino[0].brain.layer1weights[2][6] = 4.251650810241699;
    dino[0].brain.layer1weights[2][7] = -4.034817218780518;
    dino[0].brain.layer1weights[3][0] = -2.769467830657959;
    dino[0].brain.layer1weights[3][1] = 4.80156135559082;
    dino[0].brain.layer1weights[3][2] = 0.8049631118774414;
    dino[0].brain.layer1weights[3][3] = -2.447233200073242;
    dino[0].brain.layer1weights[3][4] = -4.223537921905518;
    dino[0].brain.layer1weights[3][5] = -3.187185525894165;
    dino[0].brain.layer1weights[3][6] = -1.6013340950012207;
    dino[0].brain.layer1weights[3][7] = -1.8049275875091553;
    dino[0].brain.layer1weights[4][0] = -1.6165316104888916;
    dino[0].brain.layer1weights[4][1] = -1.2216134071350098;
    dino[0].brain.layer1weights[4][2] = 4.2006025314331055;
    dino[0].brain.layer1weights[4][3] = 2.2704005241394043;
    dino[0].brain.layer1weights[4][4] = 4.837985992431641;
    dino[0].brain.layer1weights[4][5] = 0.9935483932495117;
    dino[0].brain.layer1weights[4][6] = 4.380819320678711;
    dino[0].brain.layer1weights[4][7] = 4.9267778396606445;
    dino[0].brain.layer1weights[5][0] = 4.645444869995117;
    dino[0].brain.layer1weights[5][1] = 4.520102500915527;
    dino[0].brain.layer1weights[5][2] = 1.5847582817077637;
    dino[0].brain.layer1weights[5][3] = 2.9509711265563965;
    dino[0].brain.layer1weights[5][4] = -0.5228638648986816;
    dino[0].brain.layer1weights[5][5] = -1.7892301082611084;
    dino[0].brain.layer1weights[5][6] = -4.05979585647583;
    dino[0].brain.layer1weights[5][7] = 1.6155328750610352;
    dino[0].brain.layer2weights[0][0] = 4.148630142211914;
    dino[0].brain.layer2weights[0][1] = -0.3278517723083496;
    dino[0].brain.layer2weights[0][2] = 2.092888832092285;
    dino[0].brain.layer2weights[0][3] = 2.773726463317871;
    dino[0].brain.layer2weights[0][4] = 1.258385181427002;
    dino[0].brain.layer2weights[0][5] = -4.745743751525879;
    dino[0].brain.layer2weights[0][6] = 0.47729015350341797;
    dino[0].brain.layer2weights[1][0] = 2.862123966217041;
    dino[0].brain.layer2weights[1][1] = -0.10666656494140625;
    dino[0].brain.layer2weights[1][2] = -2.2021050453186035;
    dino[0].brain.layer2weights[1][3] = -2.0242209434509277;
    dino[0].brain.layer2weights[1][4] = 1.7884283065795898;
    dino[0].brain.layer2weights[1][5] = -0.10635089874267578;
    dino[0].brain.layer2weights[1][6] = -2.8663241863250732;
    dino[0].brain.layer2weights[2][0] = 2.864124298095703;
    dino[0].brain.layer2weights[2][1] = 3.4619998931884766;
    dino[0].brain.layer2weights[2][2] = 4.194652557373047;
    dino[0].brain.layer2weights[2][3] = 2.195720672607422;
    dino[0].brain.layer2weights[2][4] = -3.730349063873291;
    dino[0].brain.layer2weights[2][5] = -1.5126025676727295;
    dino[0].brain.layer2weights[2][6] = -0.8650641441345215;
    dino[0].brain.layer2weights[3][0] = -0.4765501022338867;
    dino[0].brain.layer2weights[3][1] = 2.5027012825012207;
    dino[0].brain.layer2weights[3][2] = 2.630115032196045;
    dino[0].brain.layer2weights[3][3] = 2.7299652099609375;
    dino[0].brain.layer2weights[3][4] = -2.968212366104126;
    dino[0].brain.layer2weights[3][5] = 0.3880500793457031;
    dino[0].brain.layer2weights[3][6] = -4.995038032531738;
    dino[0].brain.layer2weights[4][0] = 4.316890716552734;
    dino[0].brain.layer2weights[4][1] = 4.031232833862305;
    dino[0].brain.layer2weights[4][2] = -2.1131367683410645;
    dino[0].brain.layer2weights[4][3] = -0.3379087448120117;
    dino[0].brain.layer2weights[4][4] = 2.4919910430908203;
    dino[0].brain.layer2weights[4][5] = 3.2019004821777344;
    dino[0].brain.layer2weights[4][6] = 1.0256681442260742;
    dino[0].brain.layer3weights[0][0] = 1.4678239822387695;
    dino[0].brain.layer3weights[0][1] = 1.8937368392944336;
    dino[0].brain.layer3weights[0][2] = -4.035611629486084;
    dino[0].brain.layer3weights[0][3] = -0.6737604141235352;
    dino[0].brain.layer3weights[0][4] = -1.8452305793762207;
    dino[0].brain.layer3weights[0][5] = 1.9607439041137695;
    dino[0].brain.layer3weights[1][0] = -3.8725085258483887;
    dino[0].brain.layer3weights[1][1] = -4.3901824951171875;
    dino[0].brain.layer3weights[1][2] = -2.9955780506134033;
    dino[0].brain.layer3weights[1][3] = 0.37801218032836914;
    dino[0].brain.layer3weights[1][4] = -3.0966532230377197;
    dino[0].brain.layer3weights[1][5] = 0.0627431869506836;
    dino[0].brain.layer3weights[2][0] = 1.3894076347351074;
    dino[0].brain.layer3weights[2][1] = -2.0268619060516357;
    dino[0].brain.layer3weights[2][2] = 4.949695587158203;
    dino[0].brain.layer3weights[2][3] = 0.19751787185668945;
    dino[0].brain.layer3weights[2][4] = -1.2737841606140137;
    dino[0].brain.layer3weights[2][5] = 1.1984434127807617;
    dino[0].brain.layer3weights[3][0] = 4.412817001342773;
    dino[0].brain.layer3weights[3][1] = -1.7332875728607178;
    dino[0].brain.layer3weights[3][2] = 2.7059850692749023;
    dino[0].brain.layer3weights[3][3] = -2.6067118644714355;
    dino[0].brain.layer3weights[3][4] = -0.043715476989746094;
    dino[0].brain.layer3weights[3][5] = -0.6992244720458984;
   }
   
 //----------------------------------------SHOW-------------------------------
 void show() {
   if(footFrameCount > 9 && !allDead && !pause) {
      foot = 1 - foot;
      footFrameCount = 0;
    }
    if(!dino[undead].dead) {
      dino[undead].show();
    } else {
     for(int i = undead; i < dino.length && !allDead; i++) {
       if(!dino[i].dead) {
         if(oldi != i) {
          currentDino = dino[i].giveBaby(currentDino);
          currentDino.generation = gen;
          oldi = i;
         }
          dino[i].show();
          undead = i;
          break;
       }
     }
    }
   
 }
 //-----------------------------------UPDATE------------------------------------
 void update() {
   for(int i = 0; i < dino.length && !allDead; i++) {
     if(!dino[i].dead)
      dino[i].update();
   }
 }
 //----------------------------------ALLDEAD-------------------------------------
 boolean areAllDead() {
   for(int i = 0; i < n; i++) {
      if(!dino[i].dead)
        return false;
   }  
   println(" ");
   println(" ");
   println(" ");
   println(" ");
   println(" ");
   setBest();
   calculateFitnessSum();
   bestCount = 0;
   worstCount = 0;
   nullCount = 0;
   otherCount = 0;
   undead = 0;
   return true;
 }
 
 //----------------------------------SELECTION-----------------------------------
 
 void naturalSelection() {
   int newDinoNum = dino.length - 1;
   Dinosaur[] newDino = new Dinosaur[newDinoNum];
   Dinosaur parent1 = new Dinosaur(popNum + 1);
   Dinosaur parent2 = new Dinosaur(popNum + 2);
   for(int i = 0; i < newDino.length; i++) {
      newDino[i] = new Dinosaur(i);
   }
   int randomcount = 0;
   float bar;
   int it = 0;
   //printWeights();
   for(int i = 0; i < newDinoNum; i++) {
       bar = random(1);
       if(bar > (0.1 + regressionFactor/30.0)) {
         parent1.id = selectParent().id;
         parent1 = dino[parent1.id].giveBaby(parent1);
         //newDino[i].mutateTarget1(parent1);
         parent2.id = parent1.id;
         it = 0;
         while(it < 1000 && parent1.id == parent2.id) {
           parent2.id = selectParent().id;
           it++;
         }
         parent2 = dino[parent2.id].giveBaby(parent2);
         newDino[i].mutateTarget2(parent1, parent2);
       } else
         randomcount++;
       //printWeight(parent1);
       //println(" ");
       //printWeight(parent2);
       //println(" ");
       //printWeight(newDino[i]);
       //println(" ");
   }
   dino[0] = dino[best].giveBaby(dino[0]);
   dino[0].reset();
   //dino[dino.length-1].reset();
   for(int i = 1; i < dino.length; i++) {
       newDino[i-1].giveBaby(dino[i]);
       dino[i].reset();
   }
   gen++;
   currentDino = dino[undead].giveBaby(currentDino);
   currentDino.generation = gen;
   println("BEST COUNT = " + bestCount);
   println("WORST COUNT = " + worstCount);
   println("OTHER COUNT = " + otherCount);
   println("RANDOM COUNT = " + randomcount);
   println("NULL COUNT = " + nullCount);
   
 }
 
 //----------------------------------------------------------------------------
  
  void calculateFitnessSum() {
    fitnessSum = 0;
    for(int i = 0; i <dino.length; i++) {
      fitnessSum += dino[i].fitness;
    }
    println("TOTAL: " + fitnessSum);
  }
  
  //----------------------------------------------------------------------------
  
  Dinosaur selectParent() {
    //println(fitnessSum);
    float rand = random((float)fitnessSum);
    //println(rand);
    //println("IN SELECT PARENT");
    float runningSum = 0;
    for(int i = 0; i < dino.length; i++) {
      //println(dino[i].fitness);
      runningSum += dino[i].fitness;
      if(runningSum > rand) {
        if(i == best)
          bestCount++;
        else if(i == (dino.length-1))
          worstCount++;
        else
          otherCount++;
        return dino[i];
      }
    }
    nullCount++;
    rand = random(dino.length);
    int index = floor(rand);
    
    return dino[index];
  }
  
  //---------------------------------------------------------------------------
  
  void setBest() {
   best = 0;
   worst = 0;
   for(int i=1; i < dino.length; i++) {
     if(dino[i].fitness > dino[best].fitness)
       best = i;
     if(dino[i].fitness < dino[worst].fitness)
       worst = i;
   }
   dino[best].fitness *= bestBonus; //bestBonus
   
   if(dino[worst].fitness < lastBest.fitness) {
     if(score > bestScore && bestScore > 500)
         limit++;
     if(regressionFactor < ((bestScore/100)+limit)) {
       println("Fitting lastbest to worst!");
       lastBest.giveBaby(dino[worst]);
       
       //Dinosaur temp = new Dinosaur();
       //dino[dino.length-1].giveBaby(temp);
       //dino[worst].giveBaby(dino[dino.length-1]);
       //temp.giveBaby(dino[worst]);
     } else {
         println("RESETTING WORST!");
         regressionFactor = 0;
         dino[worst].brain = new Brain();
         dino[worst].fitness = dino[best].fitness / 50;   
     }  
   }
   
   if(improved) {
     dino[best].giveBaby(lastBest);
     lastBest.generation = gen;
   }
   /*if(ceil(score) < bestScore) {
      lastBest.giveBaby(dino[worst]);
   } else
     dino[best].giveBaby(lastBest);
   */
    
   /*
   if(dino[best].fitness > lastBest.fitness) {
     println("Fitting newbest to lastbest!");
     dino[best].giveBaby(lastBest);
   }
   
   
   println("WORST: " + dino[dino.length-1].fitness);
   //dino[worst].brain = new Brain(); */
   //println("BEST: " + dino[best].fitness);
  }

 //--------------------------------------------------------------------------
 
 void printWeight(Dinosaur d) {
  if(best>=0) {
    for(int i = 0; i < hd1; i++) {
       for(int j = 0; j < ipl; j++) {
         print(d.brain.layer1weights[i][j] + " ");
       }
    }
    for(int i = 0; i < hd2; i++) {
       for(int j = 0; j < hd1; j++) {
         print(d.brain.layer2weights[i][j] + " ");
       }
    }
    for(int i = 0; i < opl; i++) {
       for(int j = 0; j < hd2; j++) {
         print(d.brain.layer3weights[i][j] + " ");
       }
    }
    
  }
}
 
}
