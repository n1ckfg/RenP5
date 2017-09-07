RenP5 renP5;

void setup() {
  fullScreen(P2D);
  pixelDensity(1);//displayDensity());
  noCursor();
  
  renP5 = new RenP5();
}

void draw() {
  background(0);
  renP5.run();

  surface.setTitle(""+frameRate);
}