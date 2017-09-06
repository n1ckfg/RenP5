class Actor extends Sprite {

  PFont font;
  int fontSize;
  color fontColor;
  
  Actor(String _name, float x, float y, color _fontColor) {
    super(_name, x, y);
    fontColor = _fontColor;
  }
  
}