/*
*  
*  This class draws a grid with a value scale and 
*  color rectangles acording to sensor input.
*
*/

class ThresholdGraph{

// variables of DisplayItems object 
PFont font;
int fontsize = 12;
String fontname = "Monaco-14.vlw";
String inputName = "";
float gridSpacing = width/42.0;
int gridValues = 25;
float potiHeight = height/6.0;
int potiWidth = 30;
int poti_ID = 0;
float scaleValue = width/1050.0;
//float scaleValueY = height/400.0;

// constructor
ThresholdGraph(){
  font = loadFont(fontname);
  textFont(font, fontsize);
  }//end ThresholdGraph
 
  // draws grid and value scale
  void update(){
    //refresh background
    background(255);
    //scale(scaleValueX, scaleValueY);  //scale everything to fit window size
    
    for (int i = 0; i < xPosArr.length; i++){
      // draw thresholds in light(min) and dark(max) grey
      noStroke();
      fill(150);
      rect(threshMin[i]*scaleValue-potiWidth/4, i*potiHeight, potiWidth/2, potiHeight);
      fill(100);
      rect(threshMax[i]*scaleValue-potiWidth/4, i*potiHeight, potiWidth/2, potiHeight); 

      // poti colours and names
      if (i == 0){ fill(255, 107, 39); inputName = "one";}
      if (i == 1){ fill(29, 224, 109); inputName = "two";}
      if (i == 2){ fill(29, 141, 224); inputName = "three";}
      if (i == 3){ fill(211, 82, 232); inputName = "four";}
      if (i == 4){ fill(100, 141, 224); inputName = "five";}
      if (i == 5){ fill(2, 82, 232); inputName = "six";}
      
      // draw poti at xpos 
      rect(xPosArr[i]*scaleValue-potiWidth/2, i*potiHeight, potiWidth, potiHeight);
      
      // draw xpos as text
      fill(0);
      text(xPosArr[i]+inputName, xPosArr[i]*scaleValue, i*potiHeight+potiHeight/2);
      }//end for
    
    // draw grid to fit window size
    stroke(0);
    strokeWeight(1);
    
    // vertical lines
    for (int i=0; i<width/gridSpacing; i++){
      line(i*gridSpacing, 0, i*gridSpacing, height);
      textAlign(LEFT);
      text(i*gridValues, i*gridSpacing+2, fontsize);
      }//end for

  }// end update
}// end class Display
