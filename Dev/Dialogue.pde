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



