class RenP5 {
  
  int sceneCounter = 0;
  
  Cam cam;
  Scene[] scenes;
  Actor[] actors;
  Prop[] props;
  Sound[] sounds;
  
  Script script;
  
  RenP5() {
    cam = new Cam();
    setupScenes();
    setupActors();
  }
  
  void update() {
    //
  }
  
  void draw() {
    drawScenes();
    drawActors();
    cam.run();
    surface.setTitle(""+frameRate);
  }
  
  void run() {
    update();
    draw();
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
    actors[0] = new Actor("images/actors/robot1.png", (width/2) - 200, height/2, "Robot1");
    actors[1] = new Actor("images/actors/robot2.png", (width/2) + 200, height/2, "Robot2");
  }
  
  void drawActors() {
    for (int i=0; i<actors.length; i++) {
      actors[i].run();
    }
  }
  
}