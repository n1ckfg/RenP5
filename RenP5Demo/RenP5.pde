class RenP5 {
  
  Script script;
  PFont font;
  int fontSize;
  color fontColor;
  int dialogueHeight = 200;
  String dialogue1 = "";
  String dialogue2 = "";
  
  RenP5() {
    script = new Script();

    fontSize = 28;
    font = createFont("Arial", fontSize);
    fontColor = color(127);
  }
  
  void update() {
    script.update();
  }
  
  void draw() {
    drawScenes();
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
    text(dialogue1, fontSize * 2, height-(dialogueHeight-(fontSize*2)));
    text(dialogue2, fontSize * 2, height-(dialogueHeight-(fontSize*4)));
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