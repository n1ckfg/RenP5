class Script {
  
  ArrayList<Scene> scenes;
  
  Scene currentScene;
  
  Scene Saga1, Saga2;
  Actor RobotBlue, RobotRed;
  
  Script() {
    setupScenes();
    setupActors();
    
    gotoScene(Saga1);
  }

  void setupScenes() {
    scenes = new ArrayList<Scene>();

    Saga1 = new Scene("Saga1");
    Saga2 = new Scene("Saga2");
    
    scenes.add(Saga1);
    scenes.add(Saga2);
  }
  
  void setupActors() {
    RobotBlue = new Actor("RobotBlue", (width/2) - 200, height/2, color(0, 127, 255));
    RobotRed = new Actor("RobotRed", (width/2) + 200, height/2, color(255,127,0));
    
    Saga1.actors.add(RobotBlue);
    Saga2.actors.add(RobotRed);  
  }
  
  void gotoScene(Scene scene) {
    for (int i=0; i<scenes.size(); i++) {
      Scene s = scenes.get(i);
      s.alive = s.name == scene.name;
      if (s.alive) currentScene = s;
    }
  }
  
  void update() {
    if (currentScene == Saga1) {
      if (Saga1.counter == 0) {
        renP5.dialogue1 = "Scooby?";
        renP5.dialogue2 = "Doobie.";
      } else if (Saga1.counter == 1) {
        renP5.dialogue1 = "Bye now!";
        renP5.dialogue2 = "Uh-huh.";
      } else if (Saga1.counter == 2) {
        gotoScene(Saga2);   
      }
    } else if (currentScene == Saga2) {
      renP5.dialogue1 = "Dooo-oo-ooobie.";
      renP5.dialogue2 = "Yeah, doobie.";
    }
  }
  
}