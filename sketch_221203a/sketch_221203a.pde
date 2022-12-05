PImage img1,img2;
int i = 0;

void setup(){
  size(800,800);
  img1 = loadImage("pikachu.jpg");//& ("duck.jpg");
  img2 =  loadImage("comic grating.png");
}

void draw(){
    
    image (img1,0 ,0);
    image (img2,i-800 ,0);
      i ++;
      if (i > 1600){
        i = 0;      
      }
}      
