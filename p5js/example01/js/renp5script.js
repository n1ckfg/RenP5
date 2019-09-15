"use strict";

class RenP5Script extends RenP5 {

  Actor RobotBlue, RobotRed;
  Scene City, CaveBlue, CaveRed;
  
  RenP5Script() {
    super();
  }
  
  void setupActors() {
    RobotBlue = new Actor("RobotBlue", color(0, 127, 255));
    RobotBlue.addState("cookie");
    
    RobotRed = new Actor("RobotRed", color(255,127,0));
    RobotRed.addState("nocookie");
  }

  void setupScenes() {
    City = addScene("City");
    City.addActor(RobotBlue, (width/2) - 200, (height/2) + 87);
    City.addActor(RobotRed, (width/2) + 200, (height/2) + 87);

    CaveRed = addScene("CaveRed");
    CaveRed.addActor(RobotRed, width/2, (height/2) + 87);  

    CaveBlue = addScene("CaveBlue");
    CaveBlue.addActor(RobotBlue, width/2, (height/2) + 87);  
  }
  
  void begin() {
    gotoScene(City);
  }
  
  void update() {
    if (dialogue.currentScene == City) {
      RobotRed.setState("main");
      RobotBlue.setState("main");
      switch(City.counter) {
        case 0:
          speak("Once upon a time...");
          break;
        case 1:
          speak(RobotBlue, "Hey, RobotRed?");
          speak(RobotRed, "Yeah, RobotBlue?");
          break;
        case 2:
          speak(RobotBlue, "I would like a cookie too.");
          speak(RobotRed, "That's nice, RobotBlue.");
          break;  
        case 3:
          choice(1, "No cookie for that wretch.", 4);
          choice(2, "Aw, give the cookie to RobotBlue.", 5);
          break;
        case 4:
          gotoScene(CaveRed);  
          break;
        case 5:
          gotoScene(CaveBlue);
          break;
      }
    } else if (dialogue.currentScene == CaveRed) {
      RobotRed.setState("main");
      RobotBlue.setState("main");
      switch(CaveRed.counter) {
        case 0:
          speak("Several hours later...");
          break;
        case 1:
          speak(RobotRed, "I hate that guy.");
          break;
        case 2:
          gotoScene(City);
          break;  
      }
    } else if (dialogue.currentScene == CaveBlue) {
      RobotRed.setState("nocookie");
      RobotBlue.setState("cookie");
      switch(CaveBlue.counter) {
        case 0:
          speak("Several hours later...");
          break;
        case 1:
          speak(RobotBlue, "What a fine fellow.");
          break;
        case 2:
          gotoScene(City);
          break;  
      }
    }
  }
  
}