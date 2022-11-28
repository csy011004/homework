int bgWidth = 500;
int bgHeight = 500;
float lineSize = 0;
float colSize = 0;

color[] colors = {#000000,#ffffff,#ff0000,#ffff00,#0000ff};

void m(){
  for(int i = 0; i < bgHeight; i += lineSize + 5){
    lineSize = random(5,bgWidth/2);
    for (int c = 0; c< bgWidth; c += colSize + 5){
      colSize = random(5,bgHeight/2);
      
      color rectC = colors[ int (random(colors.length))];
      fill(rectC);
      rect(i,c,lineSize,colSize);
      stroke(0);
      strokeWeight(5);   
    }
  }
}

void setup(){
  size(500,500);
  background(0);
  m();
}

void draw(){
  if(mousePressed){
    m();
  }
}
