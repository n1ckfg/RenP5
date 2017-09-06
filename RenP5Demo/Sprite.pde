class Sprite {
  
  PVector pos;
  PGraphics g;
  PImage img;
  String url;
  boolean scaleToFit = false;
  String name = "Empty";
  int alpha = 0;
  boolean alive = false;
  int fadeDelta = 5;
 
  Sprite(String _name) {
    init(_name, width/2, height/2, "scene");
  }
  
  Sprite(String _name, float x, float y) {
    init(_name, x, y, "actor");
  }
      
  void init(String _name, float x, float y, String _type) {
    name = _name;
    if (_type.equals("actor")) {
      scaleToFit = false;
      url = "actors/" + _name + ".png";      
    } else if (_type.equals("scene")) {
      scaleToFit = true;
      url = "scenes/" + _name + ".png";      
    }
    img = loadImage(url);
    alpha = 0;
    alive = true;
    
    pos = new PVector(x, y);
    if (scaleToFit) img.resize(0, height);
    g = createGraphics(img.width, img.height, P2D);
  }
  
  void update() {
    fader();
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