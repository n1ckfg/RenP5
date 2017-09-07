class RenP5 {
  
  ArrayList<Scene> scenes;
  Scene currentScene;
  Dialogue dialogue;
  
  Scene Saga1, Saga2;
  Actor RobotBlue, RobotRed;
  
  RenP5() {
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
    RobotBlue = new Actor("RobotBlue", color(0, 127, 255));
    RobotRed = new Actor("RobotRed", color(255,127,0));
    
    Saga1.addActor(RobotBlue, (width/2) - 200, (height/2) + 87);
    Saga1.addActor(RobotRed, (width/2) + 200, (height/2) + 87);

    Saga2.addActor(RobotRed, width/2, (height/2) + 87);  
  }
  
  void update() {
    if (currentScene == Saga1) {
      if (Saga1.counter == 0) {
        speak(RobotBlue, "Hey, RobotRed?");
        speak(RobotRed, "Yeah, RobotBlue?");
      } else if (Saga1.counter == 1) {
        speak(RobotBlue, "I want a cookie.");
        speak(RobotRed, "That's nice, RobotBlue.");
      } else if (Saga1.counter == 2) {
        gotoScene(Saga2);   
      }
    } else if (currentScene == Saga2) {
      if (Saga2.counter == 0) {
        speak(RobotRed, "I hate that guy.");
      } else if (Saga2.counter == 1) {
        gotoScene(Saga1);
      }
    }
  }
   
  void draw() {
    for (int i=0; i<scenes.size(); i++) {
      Scene s = scenes.get(i);
      s.run();
      if (s.alive) {
        for (int j=0; j<s.actors.size(); j++) {
          Actor a = s.actors.get(j);
          a.run();
        }
      }
    }
    
    dialogue.draw();
  }
  
  void run() {
    update();
    draw();
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