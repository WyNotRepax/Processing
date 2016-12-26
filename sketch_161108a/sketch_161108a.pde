void setup(){
  size(100,100);
  boolean[] asdf = generate(6);
  for(int n = 0; n < asdf.length; n++){
    println(asdf[n]);
  }
}

void draw(){
  
}

boolean[] generate(int step){
  boolean[] string = new boolean[1];
  for(int n = 0; n < step; n++){
    if(n == 0){
      string[0] = true;
    }
    else{
      string = generateNextLevel(string);
    }
  }
  return string;
}

boolean[] generateNextLevel(boolean[] givenstring){
  int l = givenstring.length*2;
  boolean[] returnstring = new boolean[l];
  for (int n = 0; n > l; n++){ //<>// //<>//
    if(n < (l/2)){
      returnstring[n] = givenstring[n];
    }
    else{
      
      returnstring[n] = !givenstring[n%(l/2)];
    }
  }
  return returnstring;
}