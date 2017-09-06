class RenP5 {
  
  Scene[] scenes;
  Actor[] actors;
  
  Script script;
  PFont font;
  int fontSize;
  color fontColor;
  int dialogueHeight = 200;
  int sceneCounter = 0;

  RenP5() {
    script = new Script();

    fontSize = 28;
    font = createFont("Arial", fontSize);
    fontColor = color(127);
    
    setupScenes();
    setupActors();
  }
  
  void update() {
    script.update();
  }
  
  void draw() {
    drawScenes();
    drawActors();
    drawText();
    //surface.setTitle(""+frameRate);
  }
  
  void run() {
    update();
    draw();
  }
  
  void drawText() {
    fill(0, 200);
    noStroke();
    rect(0, height-dialogueHeight, width, height);
    stroke(255);
    line(0, height-dialogueHeight, width, height-dialogueHeight);
    fill(255);
    textFont(font, fontSize);
    text("askaaaaaa", fontSize * 2, height-(dialogueHeight-(fontSize*2)));
  }
  
  void setupScenes() {
    scenes = new Scene[script.sceneNames.length];
    for (int i=0; i<scenes.length; i++) {
      scenes[i] = new Scene(script.sceneNames[i]);
    }
  }
  
  void drawScenes() {
    for (int i=0; i<scenes.length; i++) {
      scenes[i].run();
    }      
  }

  void setupActors() {
    actors = new Actor[script.actorNames.length];
    for (int i=0; i<actors.length; i++) {
      actors[i] = new Actor(script.actorNames[i], 0, 0, color(127));
    }    
  }
  
  void drawActors() {
    for (int i=0; i<actors.length; i++) {
      actors[i].run();
    }
  }
  
  void newScene(String name) {
    for (int i=0; i<scenes.length; i++) {
      scenes[i].alive = scenes[i].name == name;
    }
    sceneCounter = 0;
  }
  
  Scene getScene(String name) {
    Scene s = null;
    for (int i=0; i<scenes.length; i++) {
      if (scenes[i].name.equals(name)) {
        s = scenes[i];
        break;
      }
    }
    return s;
  }
  
  void newActors(String[] names) {
    for (int i=0; i<actors.length; i++) {
      actors[i].alive = false;
      for (int j=0; j<names.length; j++) {
        if (actors[i].name == names[j]) actors[i].alive = true;
      }
    }
  }
  
  Actor getActor(String name) {
    Actor a = null;
    for (int i=0; i<actors.length; i++) {
      if (actors[i].name.equals(name)) {
        a = actors[i];
        break;
      }
    }
    return a;
  }
  
}