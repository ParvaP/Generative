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

public class Auto extends PApplet {

boolean[][] board; //board that holds the values of the automata
//the first value of the board changes the x while the second changes the y

int boardS = 30; //height/width of the square board
float cellS; //height/width of each cell

int sW = 1; //stroke weight, this should be added to the size if you want to change it


public void setup(){
   //width,height
  background (0); //changes the backgroud to black
  stroke (255, 255, 255, 255); //makes the line white
  strokeWeight(sW);
  noFill();

  cellS = getCellSize();
  board = new boolean[boardS][boardS];
  resetBoard();
}

public void draw(){
  clear();
  drawBoard();
}

public float getCellSize(){
  return (width-sW)/boardS;
}

public void drawBoard(){
  for (int rows = 0; rows < boardS; rows++){
    for (int cols = 0; cols < boardS; cols++){
      if (board[cols][rows]){
        fill(255);
      } else {
        noFill();
      }
      rect(cols*cellS,rows*cellS,cellS,cellS); //the outlines of the cells
    }
  }
}

public void mouseClicked(){
  for (int rows = 0; rows < boardS; rows++){
    for (int cols = 0; cols < boardS; cols++){
      if (mouseX > cols*cellS && mouseX < cols*cellS+cellS && mouseY > rows*cellS && mouseY < rows*cellS+cellS){
        toggle(cols,rows);
      }
    }
  }
}

public void toggle (int cols, int rows){
  if (board[cols][rows]){
    board[cols][rows] = false;
  } else{
    board[cols][rows] = true;
  }
}

public void resetBoard (){
  for (int i = 0; i < boardS; i++){
    for (int ii = 0; ii < boardS; ii++){
      board[ii][i] = false;
    }
  }
}
  public void settings() {  size (901, 901); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Auto" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
