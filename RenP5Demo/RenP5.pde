class RenP5 {
  
  Scene[] scenes;
  Actor[] actors;
  
  Script script;
  PFont font;
  int fontSize;
  color fontColor;
  int dialogueHeight = 200;

  RenP5() {
    fontSize = 28;
    font = createFont("Arial", fontSize);
    fontColor = color(127);
    
    script = new Script();
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
    scenes = new Scene[5];
    scenes[0] = new Scene("images/scenes/saga01.png", "Saga1");
    scenes[1] = new Scene("images/scenes/saga02.png", "Saga2");
    scenes[2] = new Scene("images/scenes/saga03.png", "Saga3");
    scenes[3] = new Scene("images/scenes/saga04.png", "Saga4");
    scenes[4] = new Scene("images/scenes/saga05.png", "Saga5");
  }
  
  void drawScenes() {
    for (int i=0; i<scenes.length; i++) {
      scenes[i].run();
    }      
  }

  void setupActors() {
    actors = new Actor[2];
    actors[0] = new Actor("images/actors/robot1.png", (width/2) - 200, height/2, "Robot1", color(0,127,255));
    actors[1] = new Actor("images/actors/robot2.png", (width/2) + 200, height/2, "Robot2", color(255,0,127));
  }
  
  void drawActors() {
    for (int i=0; i<actors.length; i++) {
      actors[i].run();
    }
  }
  
  void setScene(String name) {
    for (int i=0; i<scenes.length; i++) {
        scenes[i].alive = scenes[i].name == name;
    }
  }
  
  String getScene() {
    String returns = "";
    for (int i=0; i<scenes.length; i++) {
      if (scenes[i].alive) {
        returns = scenes[i].name;
        break;
      }
    }
    return returns;
  }
  
  void setActors(String[] names) {
    for (int i=0; i<actors.length; i++) {
      actors[i].alive = false;
      for (int j=0; j<names.length; j++) {
        if (actors[i].name == names[j]) actors[i].alive = true;
      }
    }
  }
  
  String[] getActors() {
    ArrayList<String> returns = new ArrayList<String>();
    for (int i=0; i<actors.length; i++) {
      if (actors[i].alive) returns.add(actors[i].name);
    }
    return returns.toArray(new String[returns.size()]);
  }
  
}