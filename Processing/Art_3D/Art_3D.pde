int[][] points = new int[1000][3];
int c = 0;
int d = 4;

void setup(){
    size(1200, 900);
    background (0);
    stroke(255);
}

void draw(){
    for (int i = 0; i < c; i++){
        line (points[i][0],points[i][1],points[i][0],height-points[i][1]);
        if (i > 0){
            line (points[i][0],points[i][1],points[i-1][0],points[i-1][1]);
            line (points[i][0],height-points[i][1],points[i-1][0],height-points[i-1][1]);
            line (points[i][0],height/2,points[i-1][0],height/2);
            for (int ii = 0; ii < d; ii++){
                line(points[i][0],ii*points[i][2]/d+points[i][1],points[i-1][0],ii*points[i-1][2]/d+points[i-1][1]);
                line(points[i][0],height-(ii*points[i][2]/d+points[i][1]),points[i-1][0],height-(ii*points[i-1][2]/d+points[i-1][1]));
            }
        }
    }
}

void mouseClicked() {
    //if (frameCount % 10 == 0){
    points[c][0] = mouseX;
    points[c][1] = mouseY;
    points[c][2] = height/2-mouseY;

    c++;
    //}
}
