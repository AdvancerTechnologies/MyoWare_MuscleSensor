void threshHolding(){
  for (int i=0; i<threshMin.length; i++) {
    float maxi=threshMax[i];
    float mini=threshMin[i];
    float dif = (maxi-mini)/255;
    messageArr[i]= xPosArr[i]-threshMin[i];
    if (messageArr[i] <0) messageArr[i]=0;
    float temp = messageArr[i];   
    temp = temp/dif;
    messageArr[i] = int(temp);
    if (messageArr[i] <0) messageArr[i]=0;
    if (messageArr[i] >255) messageArr[i]=255;
    }
}
