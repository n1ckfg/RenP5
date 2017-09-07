class RenP5Script extends RenP5 {

  Actor RobotBlue, RobotRed;
  Scene Saga1, Saga2;
  
  RenP5Script() {
    super();
  }
  
  void setupActors() {
    RobotBlue = new Actor("RobotBlue", color(0, 127, 255));
    RobotRed = new Actor("RobotRed", color(255,127,0));
  }

  void setupScenes() {
    Saga1 = addScene("Saga1");
    Saga1.addActor(RobotBlue, (width/2) - 200, (height/2) + 87);
    Saga1.addActor(RobotRed, (width/2) + 200, (height/2) + 87);

    Saga2 = addScene("Saga2");
    Saga2.addActor(RobotRed, width/2, (height/2) + 87);  
  }
  
  void begin() {
    gotoScene(Saga1);
  }
  
  void update() {
    if (currentScene == Saga1) {
        switch(Saga1.counter) {
          case 0:
            speak(Saga1, "Once upon a time...");
            break;
          case 1:
            speak(RobotBlue, "Hey, RobotRed?");
            speak(RobotRed, "Yeah, RobotBlue?");
            break;
          case 2:
            speak(RobotBlue, "I want a cookie too.");
            speak(RobotRed, "That's nice, RobotBlue.");
            break;  
          case 3:
            gotoScene(Saga2);   
            break;
        }
    } else if (currentScene == Saga2) {
        switch(Saga2.counter) {
          case 0:
            speak(Saga2, "Several hours later...");
            break;
          case 1:
            speak(RobotRed, "I hate that guy.");
            break;
          case 2:
            gotoScene(Saga1);
            break;  
        }
    }
  }
  
}