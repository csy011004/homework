float centerX,centerY,offsetX,offsetY,inc,r,rd;
int segNumber;

void setup()
{
  size(1920,1080);
  background(0);
  noFill();
  colorMode(HSB);
  centerX = 0; centerY = height / 4;
  offsetX = offsetY = 0;
  inc = 0.725;
  segNumber = 500;
  r = 0;rd = 350;
}

void draw()
{
  stroke((frameCount * 0.05) % 255,180,255,64);
  beginShape();
  for(int i = 0 ; i < segNumber ; i++) {
    float angel = TWO_PI * i / segNumber;
    PVector p = new PVector(cos(angel), sin(angel));
    float radius = r + rd * noise(offsetX + p.x * inc, offsetY + p.y * inc);
    p.mult(radius);
    vertex(p.x + centerX, p.y + centerY);
  }
  endShape(CLOSE);
    float offset = 0.003;
    offsetX += offset; offsetY += offset;
    centerX += 1;
    if (centerX > width){
      centerX = 0;
      centerY = centerY + height/4;
    }
    println ("frameRate;"+frameRate);
}
