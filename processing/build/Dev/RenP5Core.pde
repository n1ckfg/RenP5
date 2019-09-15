class RenP5 {
  
  ArrayList<Scene> scenes;
  Dialogue dialogue;
  
  RenP5() {
    dialogue = new Dialogue();
    scenes = new ArrayList<Scene>();
    
    setupActors();
    setupScenes();
    begin();
  }

  void setupActors() {
    //
  }
  
  void setupScenes() {
    //
  }
  
  void begin() {
    //
  }

  void update() {
    //
  }
   
  void draw() {
    for (int i=0; i<scenes.size(); i++) {
      Scene s = scenes.get(i);
      s.run();
      
      for (int j=0; j<s.actors.size(); j++) {
        Actor a = s.actors.get(j);
        a.alive = s.alive;
        a.alpha = s.alpha;
        a.pos = s.pos.get(j);
        a.run();
      }
    }
    
    dialogue.draw();
  }
  
  void run() {
    update();
    draw();
  }
  
  void speak(Actor a, String txt) {
    dialogue.choiceBlock = false;
    int index = 0;
    if (dialogue.currentScene.actors.size() > 1) {
      for (int i=0; i<dialogue.currentScene.actors.size(); i++) {
        if (a == dialogue.currentScene.actors.get(i)) {
          index = i;
          break;
        }
      }
    }
    dialogue.slot[index].fontColor = a.fontColor;
    dialogue.slot[index].txt = a.name + ": " + txt;
  }
 
  void speak(String txt) {
    dialogue.choiceBlock = false;
    dialogue.slot[0].fontColor = dialogue.defaultFontColor;
    dialogue.slot[0].txt = txt;
  }
  
  void choice(int index, String txt, int dest) {
    dialogue.choiceBlock = true;
    dialogue.slot[index-1].fontColor = dialogue.defaultFontColor;
    dialogue.slot[index-1].txt = index + ". " + txt;    
    if (keyPressed) {
      String k = ""+key;
      if (k.equals(""+index)) {
        dialogue.currentScene.counter = dest;
      }
    }
  }
  
  void gotoScene(Scene scene) {
    for (int i=0; i<scenes.size(); i++) {
      Scene s = scenes.get(i);
      s.alive = s.name == scene.name;
      if (s.alive) {
        s.markTime = millis();
        dialogue.currentScene = s;
      }
    }
    for (int i=0; i<dialogue.slot.length; i++) {
      dialogue.slot[i].txt = "";
    }
  }
  
  Scene addScene(String name) {
    Scene s = new Scene(name);
    scenes.add(s);
    return s;
  }
  
}

