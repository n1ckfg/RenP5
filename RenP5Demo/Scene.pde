class Scene extends Sprite {
  
  String[] usingActors;

  Scene(String _name) {
    super(_name);
  }
  
  void update() {
    super.update();
    
    if (alive) {
      setActors(usingActors, true);
    }
  }
  
  void setActors(String[] names, boolean _alive) {
    if (names != null) {
      for (int i=0; i<renP5.actors.length; i++) {
        for (int j=0; j<names.length; j++) {
          if (renP5.actors[i].name == names[j]) renP5.actors[i].alive = _alive;
        }
      }
    }
  }
  
  String[] getActors(boolean _alive) {
    ArrayList<String> returns = new ArrayList<String>();
    for (int i=0; i<renP5.actors.length; i++) {
      if (renP5.actors[i].alive == _alive) returns.add(renP5.actors[i].name);
    }
    return returns.toArray(new String[returns.size()]);
  }
  
}