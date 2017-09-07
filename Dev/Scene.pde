class Scene extends Sprite {
  
  ArrayList<Actor> actors;
  ArrayList<PVector> pos;
  
  int counter = 0;
  String monologue;
  int markTime = 0;
  
  Scene(String _name) {
    super(_name, "scene");
    actors = new ArrayList<Actor>();
    pos = new ArrayList<PVector>();
  }
  
  void update() {
    super.update();
    //actorsSync();
    if (!alive) counter = 0;
  }
  
  void advance() {
    counter++;
  }
  
  /*
  void actorsSync() {
    for (int i=0; i<actors.size(); i++) {
      Actor a = actors.get(i);
      a.alive = alive;
      a.pos = pos.get(i);
    }
  }
  */
  
  void addActor(Actor a, float x, float y) {
    actors.add(a);
    pos.add(new PVector(x, y));
  }

}

