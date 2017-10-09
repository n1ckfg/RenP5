class Sprite {
  
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
      url = "actors/" + _name + "/" + _name + "_main.png";      
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

