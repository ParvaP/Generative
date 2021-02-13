int[][] board = new int[10][5];
int numCols = 10;
int numRows = 5;

int boardY = 350;
int yOffset = 100;

//height and width of the paddle
int pH;
int pW;

void setup(){
    size (1200, 900);
    background (0);

    resetBoard();
}
void draw(){
    drawBoard();
}

//Draws the board
void drawBoard(){
    //width and height of each brick
    int bW = width/numCols;
    int bH = boardY/numRows;

    for (int col = 0; col < numCols; col++){
        for (int row = 0; row < numRows; row++){
            rect(col*bW, row*bH + yOffset, bW, bH);
        }
    }
}

drawPaddle(){}

//Initializes the board to 1
void resetBoard(){
    for (int col = 0; col < numCols; col++){
        for (int row = 0; row < numRows; row++){
            board[col][row] = 1;
        }
    }
}
