class Brain {
 
  double[][] layer1weights, layer2weights, layer3weights;
  double[] ip, net1, net2, op, hiddenop;
  
  Brain() {
    layer1weights = new double[hd1][ipl+1];
    if(hd2 != 0)
      layer2weights = new double[hd2][hd1+1];
    if(hd2 != 0)
      layer3weights = new double[opl][hd2+1];
    else
      layer3weights = new double[opl][hd1+1];
    ip = new double[ipl];
    net1 = new double[hd1];
    if(hd2 != 0)
      net2 = new double[hd2];
    //hiddenop = new double[5];
    op = new double[opl];
    setupWeights();
    //giveWeights();
  }
  
  //---------------------------SETUPWEIGHTS----------------------------------------
  
  void setupWeights() {
    int lim = 0;
    if(hd2 != 0)
      lim = hd2+1;
    else
      lim = hd1+1;
    for(int i = 0; i < hd1; i++) {
       for(int j = 0; j < ipl+1; j++) {
          layer1weights[i][j] = random(-5,5); 
          if(hd2 != 0 && i < hd2 && j < hd1+1)
            layer2weights[i][j] = random(-5,5);
          if(i < opl && j < lim)
            layer3weights[i][j] = random(-5,5);
       }
    }
  }
  
  //---------------------------SETUPWEIGHTS----------------------------------------
  
  void giveWeights() {
    layer1weights[0][0] = 3.41701602935791;
    layer1weights[0][1] = -4.183105945587158;
    layer1weights[0][2] = -3.790559768676758;
    layer1weights[0][3] = -2.784562587738037;
    layer1weights[0][4] = -3.7958872318267822;
    layer1weights[0][5] = 3.733386993408203;
    layer1weights[0][6] = 4.022819519042969;
    layer1weights[0][7] = -3.5699100494384766;
    layer1weights[1][0] = 2.72927188873291;
    layer1weights[1][1] = -1.5047545433044434;
    layer1weights[1][2] = 0.8839607238769531;
    layer1weights[1][3] = -4.262838840484619;
    layer1weights[1][4] = 1.456796646118164;
    layer1weights[1][5] = -2.712679386138916;
    layer1weights[1][6] = -0.8599715232849121;
    layer1weights[1][7] = 2.1105380058288574;
    layer1weights[2][0] = -1.4972467422485352;
    layer1weights[2][1] = -3.5828793048858643;
    layer1weights[2][2] = -2.104447364807129;
    layer1weights[2][3] = -3.226168632507324;
    layer1weights[2][4] = -4.147996425628662;
    layer1weights[2][5] = -2.1887593269348145;
    layer1weights[2][6] = 4.251650810241699;
    layer1weights[2][7] = -4.034817218780518;
    layer1weights[3][0] = -2.769467830657959;
    layer1weights[3][1] = 4.80156135559082;
    layer1weights[3][2] = 0.8049631118774414;
    layer1weights[3][3] = -2.447233200073242;
    layer1weights[3][4] = -4.223537921905518;
    layer1weights[3][5] = -3.187185525894165;
    layer1weights[3][6] = -1.6013340950012207;
    layer1weights[3][7] = -1.8049275875091553;
    layer1weights[4][0] = -1.6165316104888916;
    layer1weights[4][1] = -1.2216134071350098;
    layer1weights[4][2] = 4.2006025314331055;
    layer1weights[4][3] = 2.2704005241394043;
    layer1weights[4][4] = 4.837985992431641;
    layer1weights[4][5] = 0.9935483932495117;
    layer1weights[4][6] = 4.380819320678711;
    layer1weights[4][7] = 4.9267778396606445;
    layer1weights[5][0] = 4.645444869995117;
    layer1weights[5][1] = 4.520102500915527;
    layer1weights[5][2] = 1.5847582817077637;
    layer1weights[5][3] = 2.9509711265563965;
    layer1weights[5][4] = -0.5228638648986816;
    layer1weights[5][5] = -1.7892301082611084;
    layer1weights[5][6] = -4.05979585647583;
    layer1weights[5][7] = 1.6155328750610352;
    layer2weights[0][0] = 4.148630142211914;
    layer2weights[0][1] = -0.3278517723083496;
    layer2weights[0][2] = 2.092888832092285;
    layer2weights[0][3] = 2.773726463317871;
    layer2weights[0][4] = 1.258385181427002;
    layer2weights[0][5] = -4.745743751525879;
    layer2weights[0][6] = 0.47729015350341797;
    layer2weights[1][0] = 2.862123966217041;
    layer2weights[1][1] = -0.10666656494140625;
    layer2weights[1][2] = -2.2021050453186035;
    layer2weights[1][3] = -2.0242209434509277;
    layer2weights[1][4] = 1.7884283065795898;
    layer2weights[1][5] = -0.10635089874267578;
    layer2weights[1][6] = -2.8663241863250732;
    layer2weights[2][0] = 2.864124298095703;
    layer2weights[2][1] = 3.4619998931884766;
    layer2weights[2][2] = 4.194652557373047;
    layer2weights[2][3] = 2.195720672607422;
    layer2weights[2][4] = -3.730349063873291;
    layer2weights[2][5] = -1.5126025676727295;
    layer2weights[2][6] = -0.8650641441345215;
    layer2weights[3][0] = -0.4765501022338867;
    layer2weights[3][1] = 2.5027012825012207;
    layer2weights[3][2] = 2.630115032196045;
    layer2weights[3][3] = 2.7299652099609375;
    layer2weights[3][4] = -2.968212366104126;
    layer2weights[3][5] = 0.3880500793457031;
    layer2weights[3][6] = -4.995038032531738;
    layer2weights[4][0] = 4.316890716552734;
    layer2weights[4][1] = 4.031232833862305;
    layer2weights[4][2] = -2.1131367683410645;
    layer2weights[4][3] = -0.3379087448120117;
    layer2weights[4][4] = 2.4919910430908203;
    layer2weights[4][5] = 3.2019004821777344;
    layer2weights[4][6] = 1.0256681442260742;
    layer3weights[0][0] = 1.4678239822387695;
    layer3weights[0][1] = 1.8937368392944336;
    layer3weights[0][2] = -4.035611629486084;
    layer3weights[0][3] = -0.6737604141235352;
    layer3weights[0][4] = -1.8452305793762207;
    layer3weights[0][5] = 1.9607439041137695;
    layer3weights[1][0] = -3.8725085258483887;
    layer3weights[1][1] = -4.3901824951171875;
    layer3weights[1][2] = -2.9955780506134033;
    layer3weights[1][3] = 0.37801218032836914;
    layer3weights[1][4] = -3.0966532230377197;
    layer3weights[1][5] = 0.0627431869506836;
    layer3weights[2][0] = 1.3894076347351074;
    layer3weights[2][1] = -2.0268619060516357;
    layer3weights[2][2] = 4.949695587158203;
    layer3weights[2][3] = 0.19751787185668945;
    layer3weights[2][4] = -1.2737841606140137;
    layer3weights[2][5] = 1.1984434127807617;
    layer3weights[3][0] = 4.412817001342773;
    layer3weights[3][1] = -1.7332875728607178;
    layer3weights[3][2] = 2.7059850692749023;
    layer3weights[3][3] = -2.6067118644714355;
    layer3weights[3][4] = -0.043715476989746094;
    layer3weights[3][5] = -0.6992244720458984;
  }
  
  //--------------------------------THINK----------------------------------------------
  
  
  void think() {
    //Layer 1 Inputs
     for(int i = 0; i < hd1; i++) {
       net1[i] = 0;
       for(int j = 0; j < ipl; j++) {
          net1[i] += (layer1weights[i][j] * ip[j]); 
       }
       net1[i] += layer1weights[i][ipl];       
     }
     
     //Layer 2 Inputs
     for(int i = 0; i < hd2; i++) {
       net2[i] = 0;
       for(int j = 0; j < hd1; j++) {
          //net2[i] += (layer2weights[i][j] * sigmoid(net1[i]));
          net2[i] += (layer2weights[i][j] * tanhAf(net1[i]));
       }
       net2[i] += layer2weights[i][hd1];
     }
     
     //Outputs
     for(int i = 0; i < opl; i++) {
       op[i] = 0;
       if(hd2 != 0) {
         for(int j = 0; j < hd2; j++) {
            //op[i] += (layer3weights[i][j] * sigmoid(net2[i]));
            op[i] += (layer3weights[i][j] * tanhAf(net2[i]));
         }
         op[i] += layer3weights[i][hd2];
       } else {
         for(int j = 0; j < hd1; j++) {
            //op[i] += (layer3weights[i][j] * sigmoid(net2[i]));
            op[i] += (layer3weights[i][j] * tanhAf(net1[i]));
         }
         op[i] += layer3weights[i][hd1];  
       }
       //op[i] = sigmoid(op[i]);
     }
     softmax();
  }
  
  //--------------------------------------LOGSIGMOID--------------------------------------
  
  double sigmoid(double x) {
    double ans = 0;
    ans = 1/(1 + exp(-1*(float)x)); 
    return ans;
  }
  
  //--------------------------------------TANH--------------------------------------
  
  double tanhAf(double x) {
    double ans = 0;
    ans = Math.tanh(x); 
    return ans;
  }
  
  //--------------------------------------SOFTMAX--------------------------------------
  
  void softmax() {
    float total = 0.0;
    for(int i = 0; i < op.length; i++) {
      total += exp((float)op[i]);
    }
    for(int i = 0; i < op.length; i++) {
      op[i] = exp((float)op[i]) / total;
    }
  }
  
  //-----------------------------------------------------------------------------------
  
  Brain clone() {
    Brain clone = new Brain();
    int lim = 0;
    if(hd2 != 0)
      lim = hd2+1;
    else
      lim = hd1+1;
    for(int i = 0; i < hd1; i++) {
      for(int j = 0; j < ipl+1; j++) {
        clone.layer1weights[i][j] = layer1weights[i][j];
        if(hd2 != 0 && i < hd2 && j < hd1+1)
            clone.layer2weights[i][j] = layer2weights[i][j];
        if(i < opl && j < lim)
            clone.layer3weights[i][j] = layer3weights[i][j];
      }
    }
  
    return clone;
  }
  
  //--------------------------------------------------------------------------------------
  
  /*void feedback(int choice, int type) {
    
  double targetVal = op[choice];
  switch(type) {
   case 1: targetVal = op[choice] + 0.01;  //Successful
           //println("Success");
           break;
   case 2: targetVal = op[choice] - 0.35;  //Dead
           //println("dead");
           break;
   case 3: targetVal = op[choice] - 1;  //Unnecessary
           //println("Unnecessary");
           return;
           //break;
  }

  double errop = (op[choice] - targetVal) * op[choice] * (1 - op[choice]);
  //println(errop);
  //println(choice+1);
  double[] newoplayer2weights = new double[6];

  for (int i = 0; i < 5 ; i++) {
    newoplayer2weights[i] = errop * hiddenop[i];
  }

  newoplayer2weights[5] = errop;
  

  double[][] newiplayer1weights = new double[5][8];
  for (int i = 0; i < 5 ; i++) {
    newiplayer1weights[i][7] =  errop * layer2weights[choice][i] * hiddenop[i] * (1 - hiddenop[i]);
    for(int j = 0; j < 7; j++) {
      newiplayer1weights[i][j] = newiplayer1weights[i][7] * ip[j];
    }
  }
  //printWeights();
  for(int i = 0; i < 5; i++) {
    for(int j = 0; j < 8; j++) {
      layer1weights[i][j] = layer1weights[i][j] - (0.01 * newiplayer1weights[i][j]); 
    }
  }


  for(int i = 0; i < 5; i++) {
    layer2weights[choice][i] = layer2weights[choice][i] - (0.01 * newoplayer2weights[i]);
  }
  //printWeights();
  //pause = true;
} */
  
}
