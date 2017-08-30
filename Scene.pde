class Scene {
  
  PImage img;
  String url;
  String name;
  int imgWidth = 0;
  int imgHeight = 0;
  
  Scene(String _url) {
    url = _url;
    println(url);
    img = loadImage(_url);
    if (img.width > img.height) {
      imgWidth = width;
      imgHeight = img.height * (width/img.width);
    } else {
      imgHeight = img.height;   
      imgWidth = img.width * (height/img.height);
    }
  }
  
  void update() {
    //
  }
 
  void draw() {
    imageMode(CENTER);
    image(img, width/2, height/2, imgWidth, imgHeight);
  }
  
  void run() {
    update();
    draw();
  }

}