void serialEvent(String serialINPUT) {
  try
  {
    int inByte = Integer.parseInt(serialINPUT.replaceAll("(\\r|\\n)", ""));

    if (myCatch == true) {
      if (inByte != 10010) {        
        // add event to buffer
        value = inByte; 
        xPosArr[(prefix-10001)] = value;
        //println("found data");
        println(value);
      }
      else {
        // if serial is line break set value to buffer value and clear buffer
        myCatch = false;     
        //println("found footer");
      }
    } 
    //myCatch is the beginging of the each sended number used to define the port
    // myCatch gets true if serial is less than 10010 since header is 10001-10009
    if (!myCatch && inByte < 10010 && inByte > 10000) { 
      myCatch = true;
      prefix = inByte;  
      //println("found header");  
      //println(prefix);
    }
  }
  catch(NumberFormatException e)
  {
    //println(e.getMessage());
  }
  catch(NullPointerException e)
  {
    //println(e.getMessage());
  }
}

