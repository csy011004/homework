ScrollBar sbar1,sbar2;

Button bt;
float eSize;
float eColor;

void setup() {
  size(1000, 1000);
  background(255);
  ui();
}

void ui() {
  sbar1 = new ScrollBar(11, 22, 200, 10, 0, 255, 160, "tag1");
  sbar1.setValue(161);//sbar1.randomize();
  sbar2 = new ScrollBar(11, 42, 200, 10, 0, 255, 160, "tag2");
  sbar2.setValue(161);//sbar1.randomize();
  
  bt = new Button(50, height - 50, 50, 25, "test");
}

void draw(){
  eSize = sbar1.update();
  eColor = sbar2.update();
  bt.update();
  fill(eColor,20);
  rect(mouseX,mouseY,eSize,eSize);
}
