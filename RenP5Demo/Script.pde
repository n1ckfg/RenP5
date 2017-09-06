class Script {

  
  int sceneCounter = 0;
  String name = "Empty";
  
  Script() {
    //
  }

  void update() {
    for (int i=0; i<renP5.scenes.length; i++) {
      renP5.scenes[i].alive = i == sceneCounter;
    }
  }

}