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
    if (!alive) counter = 0;
  }
  
  void addActor(Actor a, float x, float y) {
    actors.add(a);
    pos.add(new PVector(x, y));
  }
  
}

