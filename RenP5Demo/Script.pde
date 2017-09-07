class Script {
  
  ArrayList<Scene> scenes;
  Scene currentScene;
  Dialogue dialogue;

  Scene Saga1, Saga2;
  Actor RobotBlue, RobotRed;
  
  Script() {
    dialogue = new Dialogue();
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
    Saga1.actors.add(RobotRed);

    Saga2.actors.add(RobotRed);  
  }
  
  void update() {
    if (currentScene == Saga1) {
      if (Saga1.counter == 0) {
        speak(RobotBlue, "Hey, Scooby?");
        speak(RobotRed, "Yeah, Doobie?");
      } else if (Saga1.counter == 1) {
        speak(RobotBlue, "I want a cookie.");
        speak(RobotRed, "That's nice, Doobie.");
      } else if (Saga1.counter == 2) {
        gotoScene(Saga2);   
      }
    } else if (currentScene == Saga2) {
        speak(RobotRed, "I hate that guy.");
    }
  }
   
  void speak(Actor a, String txt) {
    int index = 0;
    for (int i=0; i<currentScene.actors.size(); i++) {
      if (a == currentScene.actors.get(i)) {
        index = i;
        break;
      }
    }
    dialogue.slot[index].fontColor = a.fontColor;
    dialogue.slot[index].txt = a.name + ": " + txt;
  }
 
  void gotoScene(Scene scene) {
    for (int i=0; i<scenes.size(); i++) {
      Scene s = scenes.get(i);
      s.alive = s.name == scene.name;
      if (s.alive) {
        s.markTime = millis();
        currentScene = s;
      }
    }
    for (int i=0; i<dialogue.slot.length; i++) {
      dialogue.slot[i].txt = "";
    }
  }
}