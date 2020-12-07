int n = 10; //number of lines
float alphDec = 250/n; //amount alpha does down by
FLine[] lines = new FLine[n];

float a1 = 0; //num to generate first point
float a2 = 0; //num to gernerate second point

float iD1 = 1; //increment d1
float iD2 = 1; //increment d2

float s1 = 100; //scale of p1
float s2 = 200; //scale of p2


void setup(){
    size (900, 900); //width,height
    background (0); //changes the backgroud to black
    stroke (255); //makes the line white
    frameRate(10);

    for (int i = 0; i < n; i++){
        float[] p1 = p1();
        float[] p2 = p2();
        lines[i] = new FLine(p1[0],p1[1],p2[0],p2[1]);
        lines[i].fade(alphDec*i);
    }
}

void draw(){
    clear();
    drawLines();
    changeLines();
}

float[] p1 (){
    float[] p1 = new float[2];

    p1[0] = cos(a1)*s1 + width/2;
    p1[1] = sin(a1)*s2 + height/2;

    a1 += iD1;

    return p1;
}

float[] p2 (){
    float[] p2 = new float[2];

    p2[0] = -cos(a2)*s2 + width/2;
    p2[1] = -sin(a2)*s2 + height/2;

    a2 += iD2;

    return p2;
}

void drawLines(){
    for (int i = 0; i < n; i++){
        alpha(lines[i].a);
        line(lines[i].x1,lines[i].y1,lines[i].x2,lines[i].y2);
    }
}

void changeLines(){
    for (int i = 0; i < n; i++){
        float[] p1 = p1();
        float[] p2 = p2();
        lines[i].x1 = p1[0];
        lines[i].y1 = p1[1];
        lines[i].x2 = p2[0];
        lines[i].y2 = p2[1];
    }
}

class FLine{
    float x1,y1,x2,y2;
    int a = 255;

    FLine(float x1,float y1,float x2,float y2){
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
    }

    void fade(float dec){
        a -= dec;
    }
}