class RenP5 {
  
  Script script;

  RenP5() {
    script = new Script();
  }
  
  void update() {
    script.update();
  }
  
  void draw() {
    drawScenes();
    script.dialogue.draw();
    //surface.setTitle(""+frameRate);
  }
  
  void run() {
    update();
    draw();
  }
  
  void drawScenes() {
    for (int i=0; i<script.scenes.size(); i++) {
      Scene s = script.scenes.get(i);
      s.run();
      if (s.alive) {
        for (int j=0; j<s.actors.size(); j++) {
          Actor a = s.actors.get(j);
          a.run();
        }
      }
    }      
  }
  
}