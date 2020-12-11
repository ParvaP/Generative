int n = 1; //number of lines
FLine[] lines = new FLine[n];

float a1 = 0; //num to generate first point
float a2 = 0; //num to gernerate second point

float iD1 = 3; //increment d1
float iD2 = 3; //increment d2

float s1 = 400; //scale 1
float s2 = 200; //scale 2

float sX1;
float sY1;
float sX2;
float sY2;

float slow1 = random(1,200); //how slow the first point moves
float slow2 = random(1,200); //how slow the second point moves

int count = 0;


void setup(){
    size (900, 900); //width,height
    background (0); //changes the backgroud to black
    stroke (255); //makes the line white

    sX1 = randomScale();
    sY1 = randomScale();
    sX2 = randomScale();
    sY2 = randomScale();


    //Sphere Drawer
    //sX1 = 200;
    //sY1 = 200;
    //sX2 = 400;
    //sY2 = 400;
    //slow1 = slow2 / 20;
    
    // Two Circles
    // This code draws slow2-1 curve things
    sX1 = 400;
    sY1 = 400;
    sX2 = 200;
    sY2 = 200;
    slow1 = 1;
    slow2 = 21;

    println("Slow1 = " + slow1);
    println("Slow2 = " + slow2);

    for (int i = 0; i < n; i++){
        float[] p1 = p1();
        float[] p2 = p2();
        lines[i] = new FLine(p1[0],p1[1],p2[0],p2[1]);
    }
}

void draw(){
    //clear();
    drawLines();
    changeLines();
    //saveFrame("output/mov-"+nf(count,5)+".png");
    count++;

    //println(count);
}

float[] p1 (){
    float[] p1 = new float[2];

    p1[0] = cos(a1/slow1)*sX1 + width/2;
    p1[1] = sin(a1/slow1)*sY1 + height/2;

    a1 += iD1;

    return p1;
}

float[] p2 (){
    float[] p2 = new float[2];

    p2[0] = -cos(a2/slow2)*sX2 + width/2;
    p2[1] = -sin(a2/slow2)*sY2 + height/2;

    a2 += iD2;

    return p2;
}

float randomScale (){
    return random(1) > 0.5 ? s1 : s2;
}

void drawLines(){
    for (int i = 0; i < n; i++){
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

    FLine(float x1,float y1,float x2,float y2){
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
    }
}
