class Scene extends Sprite {
  
  ArrayList<Actor> actors;
  int counter = 0;
  
  Scene(String _name) {
    super(_name);
    actors = new ArrayList<Actor>();
  }
  
  void update() {
    super.update();
    actorsSync();
    if (!alive) counter = 0;
  }
  
  void advance() {
    counter++;
  }
  
  void actorsSync() {
    for (int i=0; i<actors.size(); i++) {
      actors.get(i).alive = alive;
    }
  }
  
}