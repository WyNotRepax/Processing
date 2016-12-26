import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pictest extends PApplet {

PImage i;
boolean inv;
boolean invlast;
int t;

public void setup() {
  inv = false;
  
  i = loadImage("Tobias.jpg");
  i.resize(width,height);
  
  loadPixels();
  for (int x = 0; x < pixels.length; x++){
    pixels[x] = color(red(i.pixels[x]),green(i.pixels[x]),blue(i.pixels[x]));
  }
  updatePixels();
  
}

public void draw(){
loadPixels();
  if(t % 3 == 0){
    for (int x = 0; x < pixels.length; x++){
      pixels[x] = color(255-red(pixels[x]),255-green(pixels[x]),255-blue(pixels[x]));
    }
    invlast = inv;
  }
  updatePixels();
  t++;
}

public void mousePressed() {
  inv = !inv;
}
  public void settings() {  size(1280,720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pictest" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
