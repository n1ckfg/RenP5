var rp5;

function setup() {
  createCanvas(960, 540);
  //pixelDensity(1);//displayDensity());
  noCursor();
  background(0);
  
  rp5 = new RenP5Script();
  
}

function draw() {
  background(0);
  
  rp5.run();
}

