class Sprite {
  
  PVector pos;
  PGraphics g;
  PImage img;
  String url;
  boolean scaleToFit = false;
  String name = "Empty";
  int imgWidth;
  int imgHeight;
  int alpha = 0;
  boolean alive = true;
  int fadeDelta = 5;
 
  Sprite(String _url) {
    init(_url, width/2, height/2, true);
  }
  
  Sprite(String _url, float x, float y) {
    init(_url, x, y, false);
  }
    
  void init(String _url, float x, float y, boolean scale) {
    scaleToFit = scale;
    url = _url;
    img = loadImage(url);
    alpha = 0;
    alive = true;
    
    if (scale) {
      float w = float(width);
      float h = float(height);
      float iw = float(img.width);
      float ih = float(img.height);
      if (iw > ih) {
        imgWidth = width;
        imgHeight = int(ih * (w/iw));
      } else {
        imgHeight = img.height;   
        imgWidth = int(iw * (h/ih));
      }
    } else {
      imgWidth = img.width;
      imgHeight = img.height;
    }
    
    pos = new PVector(x, y);
    g = createGraphics(imgWidth, imgHeight, P2D);
  }
  
  void update() {
    fader();
  }
 
  void draw() {
    g.beginDraw();
    g.clear();
    g.tint(color(255, alpha));
    if (scaleToFit) {
      g.image(img, 0, 0, imgWidth, imgHeight);
    } else {
      g.image(img, 0, 0);
    }
    g.endDraw();
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