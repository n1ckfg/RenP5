class Script {
  
  Scene Saga1, Saga2;
  Actor RobotBlue, RobotRed;
  
  ArrayList<Actor> test;
  
  String[] sceneNames = { "Saga1", "Saga2" };
  String[] actorNames = { "RobotRed", "RobotBlue" };
   
  Script() {
    test = new ArrayList<Actor>();
    RobotBlue = new Actor("RobotBlue", width/2, height/2, color(255,0,0));
    test.add(RobotBlue);
    println(test.size());
  }

  void update() {

  }
  
    /*
    renP5.actors[0].pos = new PVector((width/2) - 200, height/2);
    renP5.actors[0].fontColor = color(0,127,255);

    renP5.actors[0].pos = new PVector((width/2) - 200, height/2);
    renP5.actors[0].fontColor = color(0,127,255);
    */

}