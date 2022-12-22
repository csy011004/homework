class Button{
  int locX, locY;      // left top position
  int dimX, dimY;      // dimension
  int midX, midY;      // center position
  color defaultColor   = color(244, 244, 244);  // light gray
  color frameColor     = color(177, 177, 177);  // gray 
  color selectColor    = color(255, 144, 0);  // orange 
  color highlightColor = color(200, 50, 60);  // wine red
  color textColor      = color(0, 0, 0);          // black
  boolean display      = true;    // draw button ?
  boolean active       = false;   // is mouse over button ?
  String txtLabel;

  //-------------------------------------------------------------
  // create a button
  //   int left, top;        left top button rectangle position
  //   int width, height;    button size
  //   String buttonText;    button text
  //-------------------------------------------------------------
  Button(int left, int top, int width, int height, String buttonText)  {
    locX = left;
    locY = top;
    dimX = width;
    dimY = height;
    midX = locX + width / 2;
    midY = locY + height/ 2;
    txtLabel = buttonText;
  }

  //-------------------
  // set button colors
  //-------------------
  void colorize(color bar, color select, color high, color textColor){
    defaultColor   = bar;
    selectColor    = select; 
    highlightColor = high;
    textColor      = textColor;
  }

  //-------------------------------------
  // update button state and draw button
  //-------------------------------------
  void update(){
    active = (mouseX > locX) && (mouseX < (locX + dimX))
      && (mouseY > locY) && (mouseY < (locY + dimY));
    if (display){
      noLights();
      if (active && mousePressed)  fill(selectColor);
      else                         fill(defaultColor);
      if (active)  stroke(highlightColor);
      else         stroke(frameColor);
      rectMode(CORNER);
      rect(locX, locY, dimX, dimY);
      fill(textColor);
      textAlign(CENTER, CENTER);
      text(txtLabel, locX, locY, dimX, dimY);
      textAlign(LEFT);
    }
  }

  //-------------------------------------
  // return true if mouse is over button
  //-------------------------------------
  boolean mouseIsOver(){ 
    return active;
  }

  //--------------------
  // draw button
  //--------------------
  void show(){ 
    display = true;
  }

  //--------------------
  // do not draw button
  //--------------------
  void hide(){ 
    display = false;
  }
}
