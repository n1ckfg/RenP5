class Actor extends Sprite {

  PFont font;
  int fontSize;
  color fontColor;
  ArrayList<PImage> states;
  ArrayList<String> stateNames;
  
  Actor(String _name, color _fontColor) {
    super(_name, "actor");
    fontColor = _fontColor;
    
    states = new ArrayList<PImage>();
    states.add(img);
    stateNames = new ArrayList<String>();
    stateNames.add("main");
  }
  
  void addState(String _name) {
    PImage temp = loadImage("actors/" + name + "/" + name + "_" + _name + ".png");
    states.add(temp);
    stateNames.add(_name);
  }
  
  void setState(String _name) {
    for (int i=0; i<stateNames.size(); i++) {
      if (stateNames.get(i).equals(_name)) {
        img = states.get(i);
        break;
      }
    }
  }
  
}

