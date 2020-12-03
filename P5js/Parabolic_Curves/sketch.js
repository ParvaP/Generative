n = 2;

flip = false;
initial = true;

function setup() {
  createCanvas(900, 900);
  stroke (255);
  time = millis();
  del = 10;
}

function draw() {
  maxN = 30;

  if (millis() - time > del) {
    background(0);
    if ((n == maxN || n == 2 )&& !initial) {
      flip = !flip;
    } //Use this if you want it to loop

    initial = false;

    quadWidth = width/2;
    quadHeight = height/2;

    line (quadWidth, 0, quadWidth, height); //middle vertical line
    line (0, quadHeight, width, quadHeight); //middle horizontal lines



    //topleft corner
    for (i = 0; i < n; i++) {
      line (quadWidth, i*quadHeight/n, (n-i-1)*quadWidth/n, quadHeight);
    }

    //topright corner
    for (i = 0; i < n; i++) {
      line (quadWidth, i*quadHeight/n, (i+1)*quadWidth/n + quadWidth, quadHeight);
    }

    //bottonright corner
    for (i = 0; i < n; i++) {
      line (quadWidth, width-i*quadHeight/n, (i+1)*quadWidth/n + quadWidth, quadHeight);
    }

    //bottomleft corner
    for (i = 0; i < n; i++) {
      line (quadWidth, width-i*quadHeight/n, (n-i-1)*quadWidth/n, quadHeight);
    }

    if (!flip) {
      n++;
    }
    if (flip) {
      n--;
    }
    time = millis();
  }
}
