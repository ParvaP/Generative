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

public class Draw extends PApplet {

public void setup() {
   //width,height
  background (0); //changes the backgroud to black
  stroke (255, 255, 255, 255); //makes the line white
}

public void draw() {
  
}

public void circle(float x, float y, float r) {
  ellipse(x, y, r*2, r*2);
}
  public void settings() {  size (900, 900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Draw" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
