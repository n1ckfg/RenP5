class Actor extends Sprite {

  PFont font;
  int fontSize;
  color fontColor;
  
  Actor(String _url, float x, float y, String _name, color _fontColor) {
    super(_url, x, y, _name);
    fontColor = _fontColor;
  }
  
}