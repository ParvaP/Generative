boolean[][] board; //board that holds the values of the automata
//the first value of the board changes the x while the second changes the y

int boardS = 30; //height/width of the square board
float cellS; //height/width of each cell

int sW = 1; //stroke weight, this should be added to the size if you want to change it


void setup(){
  size (901, 901); //width,height
  background (0); //changes the backgroud to black
  stroke (255, 255, 255, 255); //makes the line white
  strokeWeight(sW);
  noFill();

  cellS = getCellSize();
  board = new boolean[boardS][boardS];
}

void draw(){
  clear();
  drawBoard();
}

float getCellSize(){
  return (width-sW)/boardS;
}

void drawBoard(){
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

void mouseClicked(){
  for (int rows = 0; rows < boardS; rows++){
    for (int cols = 0; cols < boardS; cols++){
      if (mouseX > cols*cellS && mouseX < cols*cellS+cellS && mouseY > rows*cellS && mouseY < rows*cellS+cellS){
        toggle(cols,rows);
      }
    }
  }
}

void toggle (int cols, int rows){
  if (board[cols][rows]){
    board[cols][rows] = false;
  } else{
    board[cols][rows] = true;
  }
}

void resetBoard (){
  for (int i = 0; i < boardS; i++){
    for (int ii = 0; ii < boardS; ii++){
      board[ii][i] = false;
    }
  }
}


