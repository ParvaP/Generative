class Circle{
    float x;
    float y;
    float r = 2;
    color c;

    Circle(float x, float y, color c){
        this.x = x;
        this.y = y;
        this.c = c;
    }

    void grow(){
        r = r+.5;
    }

    boolean wall(){
        return (x + r > width || x - r < 0 || y + r > height || y - r < 0);
    }

    void display(){
        fill(c);
        noStroke();
        ellipse(x, y, r*2, r*2);
    }
}
