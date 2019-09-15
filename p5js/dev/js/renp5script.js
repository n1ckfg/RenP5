class RenP5Script extends RenP5 {

    constructor() {
        super();
    	this.RobotBlue;
    	this.RobotRed;
    	this.City;
    	this.CaveBlue;
    	this.CaveRed;
    	this.setupActors();
    	this.setupScenes();
    	this.begin();
    }
    
    setupActors() {
        this.RobotBlue = new Actor("RobotBlue", color(0, 127, 255));
        this.RobotBlue.addState("cookie");
        
        this.RobotRed = new Actor("RobotRed", color(255,127,0));
        this.RobotRed.addState("nocookie");
    }

    setupScenes() {
        this.City = this.addScene("City");
        this.City.addActor(this.RobotBlue, (width/2) - 200, (height/2) + 87);
        this.City.addActor(this.RobotRed, (width/2) + 200, (height/2) + 87);

        this.CaveRed = this.addScene("CaveRed");
        this.CaveRed.addActor(this.RobotRed, width/2, (height/2) + 87);    

        this.CaveBlue = this.addScene("CaveBlue");
        this.CaveBlue.addActor(this.RobotBlue, width/2, (height/2) + 87);    
    }
    
    begin() {
        gotoScene(this.City);
    }
    
    update() {
        if (this.dialogue.currentScene === this.City) {
            this.RobotRed.setState("main");
            this.RobotBlue.setState("main");
            switch(this.City.counter) {
                case 0:
                    this.speak("Once upon a time...");
                    break;
                case 1:
                    this.speak(this.RobotBlue, "Hey, RobotRed?");
                    this.speak(this.RobotRed, "Yeah, RobotBlue?");
                    break;
                case 2:
                    this.speak(this.RobotBlue, "I would like a cookie too.");
                    this.speak(this.RobotRed, "That's nice, RobotBlue.");
                    break;    
                case 3:
                    this.choice(1, "No cookie for that wretch.", 4);
                    this.choice(2, "Aw, give the cookie to RobotBlue.", 5);
                    break;
                case 4:
                    this.gotoScene(this.CaveRed);    
                    break;
                case 5:
                    this.gotoScene(this.CaveBlue);
                    break;
            }
        } else if (this.dialogue.currentScene == this.CaveRed) {
            this.RobotRed.setState("main");
            this.RobotBlue.setState("main");
            switch(this.CaveRed.counter) {
                case 0:
                    this.speak("Several hours later...");
                    break;
                case 1:
                    this.speak(this.RobotRed, "I hate that guy.");
                    break;
                case 2:
                    this.gotoScene(this.City);
                    break;    
            }
        } else if (this.dialogue.currentScene == this.CaveBlue) {
            this.RobotRed.setState("nocookie");
            this.RobotBlue.setState("cookie");
            switch(this.CaveBlue.counter) {
                case 0:
                    this.speak("Several hours later...");
                    break;
                case 1:
                    this.speak(this.RobotBlue, "What a fine fellow.");
                    break;
                case 2:
                    this.gotoScene(this.City);
                    break;    
            }
        }
    }
    
}