int n = 2;
int time;
int del;
int count = 1;

boolean flip = false;
boolean initial = true;

void setup (){
  size (1000,1000); //width,height
  background (0,0,0);
  stroke (255); //changes the color of the lines to white
  
  time = millis(); //inital time
  del = 10;
}

void draw (){
  int maxN = 30; //highest the n value can go
  
  if (millis() - time > del){
  clear();
  if ((n == maxN || n == 2 )&& !initial){flip = !flip;} //Use this if you want it to loop
  
  //Use these 2 if you want it to end
  //if (n==maxN){flip = !flip;}
  //if (n == 2 && !initial){exit();}
  
  
  initial = false;
    
  int quadWidth = width/2;
  int quadHeight = height/2;
  
  line (quadWidth,0,quadWidth,height); //middle vertical line
  line (0,quadHeight, width,quadHeight); //middle horizontal lines
  
  
  
  //topleft corner
  for (int i = 0; i < n ; i++){
    line (quadWidth,i*quadHeight/n,(n-i-1)*quadWidth/n,quadHeight);
  }
  
  //topright corner
  for (int i = 0; i < n ; i++){
    line (quadWidth,i*quadHeight/n,(i+1)*quadWidth/n + quadWidth,quadHeight);
  }
  
  //bottonright corner
  for (int i = 0; i < n ; i++){
    line (quadWidth,width-i*quadHeight/n,(i+1)*quadWidth/n + quadWidth,quadHeight);
  }
  
  //bottomleft corner
  for (int i = 0; i < n ; i++){
    line (quadWidth,width-i*quadHeight/n,(n-i-1)*quadWidth/n,quadHeight);
  }
  
  if (!flip){n++;}
  if (flip){n--;}
  time = millis();
  //saveFrame("output/gif-"+nf(count,3)+".png");
  count++;
  }
}
