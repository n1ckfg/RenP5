class Actor extends Sprite {

  PFont font;
  int fontSize;
  color fontColor;
  
  Actor(String _name, color _fontColor) {
    super(_name, "actor");
    fontColor = _fontColor;
  }
  
}