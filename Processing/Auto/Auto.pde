boolean[][] board; //board that holds the values of the automata
int boardS = 30; //height/width of the square board
float cellS; //height/width of each cell



void setup() {
  size (900, 900); //width,height
  background (0); //changes the backgroud to black
  stroke (255, 255, 255, 255); //makes the line white
  strokeWeight(1);
  noFill();

  cellS = getCellSize();
  board = new boolean[boardS][boardS];
}

void draw (){
  clear();
  drawBoard();
}

float getCellSize(){
  return width/boardS;
}

void drawBoard (){
  for (int rows = 0; rows < boardS; rows++){
    for (int cols = 0; cols < boardS; cols++){
      rect(rows*cellS,cols*cellS,cellS,cellS); //the outlines of the cells
    }
  }
}

