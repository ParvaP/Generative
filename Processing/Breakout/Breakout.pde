int[][] board = new int[10][5];
int numCols = 10;
int numRows = 5;

int boardY = 350;
int yOffset = 100;

//height and width of the paddle
int pH = 30;
int pW = 200;

//x and y of the paddle
int pX;
int pY = 850;

//information about the ball
int bX = 100;
int bY = 550;
int speed = 4;
int dX = speed;
int dY = speed;
int diam = 20;

void setup(){
    size (1200, 900);
    background (0);

    pX = ((width-pW)/2); //x is in the middle of the screen
    resetBoard();
}
void draw(){
    clear();
    drawBoard();
    drawPaddle();
    drawBall();
    movePaddle();
    moveBall();
}

//draws the board
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

//draws the paddle
void drawPaddle(){
    rect(pX, pY, pW, pH);
}

//draw ball
void drawBall(){
    ellipse(bX, bY, diam, diam);
}

void movePaddle(){
    pX = mouseX - pW/2;

    //bounds the paddle so it doesn't go off screen
    if (pX < 0){
        pX = 0;
    } else if (pX > width-pW) {
        pX = width-pW;
    }
}

void moveBall(){
    bX = bX + dX;
    bY = bY + dY;

    //collision with walls
    if (bX-(diam/2) < 0 || bX+(diam/2) > width){
        dX = dX*-1;
    }
    if (bY-(diam/2) < 0){
        dY = dY*-1;
    }

    if (bX-(diam/2) > pX && bX+(diam/2) < pX+pW && bY+(diam/2) > pY && bY+(diam/2) < pY+diam){
        dY = dY*-1;
    }
    /*
    if (bY-(diam/2) > pY && bY+(diam/2) < pY+pH){
        dY = dY*-1;
    }
    */
    
}

//initializes the board to 1
void resetBoard(){
    for (int col = 0; col < numCols; col++){
        for (int row = 0; row < numRows; row++){
            board[col][row] = 1;
        }
    }
}
