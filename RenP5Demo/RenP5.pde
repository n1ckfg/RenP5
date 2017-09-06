class RenP5 {
  
  int sceneCounter = 0;
  
  Scene[] scenes;
  Actor[] actors;
  Prop[] props;
  Sound[] sounds;
  
  Script script;
  
  RenP5() {
    imageMode(CENTER);
    setupScenes();
    setupActors();
  }
  
  void update() {
    //
  }
  
  void draw() {
    drawScenes();
    drawActors();
  }
  
  void run() {
    update();
    draw();
  }
  
  void setupScenes() {
    scenes = new Scene[5];
    scenes[0] = new Scene("images/scenes/saga01.png");
    scenes[1] = new Scene("images/scenes/saga02.png");
    scenes[2] = new Scene("images/scenes/saga03.png");
    scenes[3] = new Scene("images/scenes/saga04.png");
    scenes[4] = new Scene("images/scenes/saga05.png");
  }
  
  void drawScenes() {
    for (int i=0; i<scenes.length; i++) {
      if (i == sceneCounter) {
        scenes[i].alive = true;
      } else {
        scenes[i].alive = false;
      }
      scenes[i].run();
    }      
  }

  void setupActors() {
    actors = new Actor[2];
    actors[0] = new Actor("images/actors/robot.png", width/2, height/2);
    actors[1] = new Actor("images/actors/robot.png", width/2, height/2);
  }
  
  void drawActors() {
    for (int i=0; i<actors.length; i++) {
      actors[i].run();
    }
  }
  
}