ArrayList<Circle> li = new ArrayList<Circle>();
PImage img;

void setup(){
    img = loadImage("ref2.jpg");
    size(1200,1788);
    background(0);
}

void draw(){

    int count = 0;
    int t = 500;
    int exit = 0;

    while (count<t){
        Circle circ = createCircle();
        if (circ != null){
            li.add(circ);
            count ++;
        }
        exit ++;
        if (exit > 2000){
          println("done");
          noLoop();
          break;
        }
    }

    for (int i = 0; i < li.size(); i++){
        li.get(i).display();
        if (!li.get(i).wall()){
            boolean ov = false;
            for (int ii = 0; ii < li.size(); ii++){
                if (li.get(i) != li.get(ii)){
                    if (dist(li.get(i).x, li.get(i).y,li.get(ii).x, li.get(ii).y) < li.get(i).r + li.get(ii).r){
                        ov = true;
                        break;
                    }
                }
            }
            if (!ov){
                li.get(i).grow();
            }
        }
    }
    saveFrame("out/img######.png");
}

Circle createCircle(){
    float x = random(width);
    float y = random(height);

    boolean ok = true;

    for (int i = 0; i < li.size(); i++){
        if (dist(x, y,li.get(i).x, li.get(i).y) < li.get(i).r){
            ok = false;
            break;
        }
    }
    if (ok){
        return new Circle(x,y,img.get((int)x,(int)y));
    }
    return null;
}
