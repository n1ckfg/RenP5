class Sprite {
  
  PVector pos;
  PGraphics g;
  PImage img;
  String url;
  boolean scaleToFit = false;
  String name = "Empty";
  int alpha = 0;
  boolean alive = true;
  int fadeDelta = 5;
 
  Sprite(String _url, String _name) {
    init(_url, width/2, height/2, true, _name);
  }
  
  Sprite(String _url, float x, float y, String _name) {
    init(_url, x, y, false, _name);
  }
      
  void init(String _url, float x, float y, boolean _scaleToFit, String _name) {
    name = _name;
    scaleToFit = _scaleToFit;
    url = _url;
    img = loadImage(url);
    alpha = 0;
    alive = true;
    
    pos = new PVector(x, y);
    if (scaleToFit) img.resize(0, height);
    g = createGraphics(img.width, img.height, P3D);
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