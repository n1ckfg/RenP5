class GameManager {
  
  int sceneCounter = 0;
  
  ArrayList<Actor> actors;
  ArrayList<Scene> scenes;
  ArrayList<Label> labels;
  ArrayList<Prop> props;
  ArrayList<Sound> sounds;
  
  GameManager() {
    setupScenes();
  }
  
  void update() {
    //
  }
  
  void draw() {
    drawScenes();
  }
  
  void run() {
    update();
    draw();
  }
  
  void setupScenes() {
    scenes = new ArrayList<Scene>();
    for (int i=0; i<5; i++) {
      scenes.add(new Scene("saga0" + (i+1) + ".jpg"));
    }
  }
  
  void drawScenes() {
    scenes.get(sceneCounter).run();
  }

}