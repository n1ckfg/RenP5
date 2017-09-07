class RenP5 {
  
  ArrayList<Scene> scenes;
  Scene currentScene;
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
    int index = 0;
    if (currentScene.actors.size() > 1) {
      for (int i=0; i<currentScene.actors.size(); i++) {
        if (a == currentScene.actors.get(i)) {
          index = i;
          break;
        }
      }
    }
    dialogue.slot[index].fontColor = a.fontColor;
    dialogue.slot[index].txt = a.name + ": " + txt;
  }
 
  void speak(Scene s, String txt) {
    dialogue.slot[0].fontColor = dialogue.defaultFontColor;
    dialogue.slot[0].txt = txt;
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
  
  Scene addScene(String name) {
    Scene s = new Scene(name);
    scenes.add(s);
    return s;
  }
  
}class Sprite {
  
  PVector pos;
  PGraphics g;
  PImage img;
  String url;
  boolean scaleToFit = false;
  String name = "";
  String type = "";
  int alpha = 0;
  boolean alive = false;
  int fadeDelta = 5;
 
  Sprite(String _name, String _type) {
    init(_name, _type);
  }
      
  void init(String _name, String _type) {
    name = _name;
    type = _type;
    if (type.equals("actor")) {
      scaleToFit = false;
      url = "actors/" + _name + ".png";      
    } else if (type.equals("scene")) {
      scaleToFit = true;
      url = "scenes/" + _name + ".png";      
    }
    img = loadImage(url);
    alpha = 0;
    alive = true;
    
    pos = new PVector(width/2, height/2);
    if (scaleToFit) img.resize(0, height);
    g = createGraphics(img.width, img.height, P2D);
  }
  
  void update() {
    if (type == "scene") fader();
  }
 
  void draw() {
    g.beginDraw();
    g.clear();
    g.tint(color(255, alpha));
    g.imageMode(CORNER);
    g.image(img, 0, 0);
    g.endDraw();
    
    imageMode(CENTER);
    image(g, pos.x, pos.y);
  }
  
  void run() {
    update();
    draw();
  }

  void fader() {
    if (alive && alpha < 255) {
      alpha += fadeDelta;
      if (alpha > 255) alpha = 255;
    } else if (!alive && alpha > 0) {
      alpha -= fadeDelta;
      if (alpha < 0) alpha = 0;
    }
  }
  
}

class Scene extends Sprite {
  
  ArrayList<Actor> actors;
  ArrayList<PVector> pos;
  
  int counter = 0;
  String monologue;
  int markTime = 0;
  
  Scene(String _name) {
    super(_name, "scene");
    actors = new ArrayList<Actor>();
    pos = new ArrayList<PVector>();
  }
  
  void update() {
    super.update();
    //actorsSync();
    if (!alive) counter = 0;
  }
  
  void advance() {
    counter++;
  }
  
  /*
  void actorsSync() {
    for (int i=0; i<actors.size(); i++) {
      Actor a = actors.get(i);
      a.alive = alive;
      a.pos = pos.get(i);
    }
  }
  */
  
  void addActor(Actor a, float x, float y) {
    actors.add(a);
    pos.add(new PVector(x, y));
  }

}

class Actor extends Sprite {

  PFont font;
  int fontSize;
  color fontColor;
  
  Actor(String _name, color _fontColor) {
    super(_name, "actor");
    fontColor = _fontColor;
  }
  
}

class Dialogue {

  PFont defaultFont;
  int defaultFontSize;
  color defaultFontColor;
  DialogueSlot[] slot = new DialogueSlot[3];
  int dialogueHeight;
  int delayTime = 900;
  
  Dialogue() {
    defaultFontSize = 28;
    dialogueHeight = int(defaultFontSize * 7.5);
    defaultFont = createFont("Arial", defaultFontSize);
    defaultFontColor = color(200); 

    for  (int i=0; i<slot.length; i++) {
      slot[i] = new DialogueSlot(i, defaultFont, defaultFontSize, defaultFontColor, dialogueHeight);
    }
  }

  void draw() {
    fill(0, 200);
    noStroke();
    rect(0, height-dialogueHeight, width, height);
    stroke(255);
    strokeWeight(2);
    line(0, height-dialogueHeight, width, height-dialogueHeight);
    stroke(255, 63);
    strokeWeight(6);
    line(0, height-dialogueHeight, width, height-dialogueHeight);
    
    if (millis() > rp5.currentScene.markTime + delayTime) {
      for (int i=0; i<slot.length; i++) {
        if (i==0 || slot[i-1].finished) slot[i].run();
      }
    }
  }
}

class DialogueSlot {

  PFont font;
  int fontSize;
  color fontColor;
  String txt = "";
  String txtP = "";
  String txtD = "";
  int index;
  int dialogueHeight;
  boolean finished = false;
  
  DialogueSlot(int _index, PFont _font, int _fontSize, color _fontColor, int _dialogueHeight) {
    index = _index;
    font = _font;
    fontSize = _fontSize;
    fontColor = _fontColor;
    dialogueHeight = _dialogueHeight;
  }

  void run() {
    if (!txtP.equals(txt)) {
      txtD = "";
      finished = false;
    }
    
    if (!finished && txtD.length() < txt.length()) {
      txtD += txt.charAt(txtD.length());
    } else if (txtD.length() == txt.length()) {
      finished = true;
    }
   
    textFont(font, fontSize);
    textAlign(CENTER);
    int x = width/2;
    int y = height-(dialogueHeight-(fontSize*(2+(index*2))));
    fill(0);
    text(txtD, x+2, y+2);
    fill(fontColor);    
    text(txtD, x, y);
    fill(255, 100);
    text(txtD, x-1, y-1);
    txtP = txt;
  }

}



