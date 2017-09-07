RenP5Script rp5;

void setup() {
  fullScreen(P2D);
  pixelDensity(1);//displayDensity());
  noCursor();
  
  rp5 = new RenP5Script();
}

void draw() {
  background(0);
  rp5.run();

  surface.setTitle(""+frameRate);
}