// reads analog input from the five inputs from your arduino board 
// and sends it out via serial

// variables for input pins and
int analogInput[6];
  
// variable to store the value 
int value[6]; 
 
void setup()
{
  // declaration of pin modes
  for(int i=0;i<6;i++)
  {
    analogInput[i] = i+1;
    value[i] = 0;     
    pinMode(analogInput[i], INPUT);    
  }
  
  // begin sending over serial port
  Serial.begin(9600);
}

void loop()
{
  // read the value on analog input
  for(int i=0;i<6;i++)
  {
    value[i] = analogRead(analogInput[i]);
  }

  // print out value over the serial port
  for(int i=0;i<6;i++)
  {
    Serial.println(10000 + i + 1); //prefix
    Serial.println(value[i]);
    Serial.println(10010); //end signal
  }
  // wait for a bit to not overload the port
  delay(10);
}


