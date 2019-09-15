"use strict";

class RenP5 {
    
    RenP5() {
        this.dialogue = new Dialogue();
        this.scenes = [];
        
        this.setupActors();
        this.setupScenes();
        this.begin();
    }

    setupActors() {
        //
    }
    
    setupScenes() {
        //
    }
    
    begin() {
        //
    }

    update() {
        //
    }
     
    draw() {
        for (var i=0; i<this.scenes.length; i++) {
            var s = this.scenes[i];
            s.run();
            
            for (var j=0; j<s.actors.length; j++) {
                var a = s.actors[j];
                a.alive = s.alive;
                a.alpha = s.alpha;
                a.pos = s.pos[j];
                a.run();
            }
        }
        
        this.dialogue.draw();
    }
    
    run() {
        this.update();
        this.draw();
    }
    
    speak(a, txt) {
        this.dialogue.choiceBlock = false;
        var index = 0;
        if (this.dialogue.currentScene.actors.length > 1) {
            for (var i=0; i<this.dialogue.currentScene.actors.length; i++) {
                if (a === this.dialogue.currentScene.actors[i]) {
                    index = i;
                    break;
                }
            }
        }
        this.dialogue.slot[index].fontColor = a.fontColor;
        this.dialogue.slot[index].txt = a.name + ": " + txt;
    }
 
    speak(txt) {
        this.dialogue.choiceBlock = false;
        this.dialogue.slot[0].fontColor = this.dialogue.defaultFontColor;
        this.dialogue.slot[0].txt = txt;
    }
    
    choice(index, txt, dest) {
        this.dialogue.choiceBlock = true;
        this.dialogue.slot[index-1].fontColor = this.dialogue.defaultFontColor;
        this.dialogue.slot[index-1].txt = index + ". " + txt;        
        if (keyPressed) {
            var k = ""+key;
            if (k === ""+index) {
                this.dialogue.currentScene.counter = dest;
            }
        }
    }
    
    gotoScene(scene) {
        for (var i=0; i<this.scenes.length; i++) {
            var s = this.scenes[i];
            s.alive = s.name === this.scene.name;
            if (s.alive) {
                s.markTime = millis();
                this.dialogue.currentScene = s;
            }
        }
        for (var i=0; i<this.dialogue.slot.length; i++) {
            this.dialogue.slot[i].txt = "";
        }
    }
    
    addScene(name) {
        var s = new Scene(name);
        this.scenes.push(s);
        return s;
    }
    
}

class Sprite {
    
    constructor(_name, _type) {
	    this.pos;
	    this.g;
	    this.img;
	    this.url;
	    this.scaleToFit = false;
	    this.name = "";
	    this.type = "";
	    this.alpha = 0;
	    this.alive = false;
	    this.fadeDelta = 5;
        this.init(_name, _type);
    }
            
    init(_name, _type) {
        this.name = _name;
        this.type = _type;
        if (this.type === "actor") {
            this.scaleToFit = false;
            this.url = "./images/actors/" + _name + "/" + _name + "_main.png";            
        } else if (this.type === "scene") {
            this.scaleToFit = true;
            this.url = "./images/scenes/" + _name + ".png";            
        }
        this.img = loadImage(this.url);
        this.alpha = 0;
        this.alive = true;
        
        this.pos = createVector(width/2, height/2);
        if (this.scaleToFit) this.img.resize(0, height);
        this.g = createGraphics(this.img.width, this.img.height);
    }
    
    update() {
        if (this.type == "scene") this.fader();
    }
 
    draw() {
        this.g.beginDraw();
        this.g.clear();
        this.g.tint(color(255, alpha));
        this.g.imageMode(CORNER);
        this.g.image(img, 0, 0);
        this.g.endDraw();
        
        imageMode(CENTER);
        image(this.g, this.pos.x, this.this.pos.y);
    }
    
    run() {
        this.update();
        this.draw();
    }

    fader() {
        if (this.alive && this.alpha < 255) {
            this.alpha += this.fadeDelta;
            if (this.alpha > 255) this.alpha = 255;
        } else if (!this.alive && this.alpha > 0) {
            this.alpha -= this.fadeDelta;
            if (this.alpha < 0) this.alpha = 0;
        }
    }
    
}

class Scene extends Sprite {
    
    constructor(_name) {
        super();
    	this.actors = [];
    	this.pos = [];
    
    	this.counter = 0;
    	this.monologue;
    	this.markTime = 0;
        super(_name, "scene");
    }
    
    update() {
        super.update();
        if (!this.alive) this.counter = 0;
    }
    
    addActor(a, x, y) {
        this.actors.push(a);
        this.pos.push(createVector(x, y));
    }
    
}

class Actor extends Sprite {

    constructor(_name, _fontColor) {
        super(_name, "actor");
    	//this.font;
    	this.fontSize;
    	this.states = [];
    	this.stateNames = [];        
        this.fontColor = _fontColor;
        
        this.states.push(this.img);
        this.stateNames.push("main");
    }
    
    addState(_name) {
        var temp = loadImage("./images/actors/" + this.name + "/" + this.name + "_" + _name + ".png");
        this.states.push(temp);
        this.stateNames.push(_name);
    }
    
    setState(_name) {
        for (var i=0; i<this.stateNames.length; i++) {
            if (this.stateNames[i] === _name) {
                this.img = this.states[i];
                break;
            }
        }
    }
    
}

class Dialogue {

    constructor() {
	    this.defaultFont = createFont("Arial", defaultFontSize);
	    this.defaultFontSize = 28;
	    this.defaultFontColor = color(200); 
	    this.slot = [];
	    this.dialogueHeight = parseInt(defaultFontSize * 7.5);
	    this.delayTime = 900;
	    this.currentScene;
	    this.finished = false;
	    this.choiceBlock = false;

        for (var i=0; i<3; i++) {
            this.slot.push(new DialogueSlot(i, defaultFont, defaultFontSize, defaultFontColor, dialogueHeight));
        }
    }

    draw() {
        fill(0, 200);
        noStroke();
        rect(0, height-this.dialogueHeight, width, height);
        stroke(255);
        strokeWeight(2);
        line(0, height-this.dialogueHeight, width, height-this.dialogueHeight);
        stroke(255, 63);
        strokeWeight(6);
        line(0, height-this.dialogueHeight, width, height-this.dialogueHeight);
        
        if (millis() > this.currentScene.markTime + this.delayTime) {
            this.finished = true;
            for (var i=0; i<this.slot.length; i++) {
                if (i==0 || this.slot[i-1].finished) this.slot[i].run();
                if (!this.slot[i].finished) this.finished = false;
            }
        }
    }
    
    advance() {
        if (this.finished && !this.choiceBlock) this.currentScene.counter++;
    }
}

class DialogueSlot {
    
    constructor(_index, _font, _fontSize, _fontColor, _dialogueHeight) {
	    this.txt = "";
	    this.txtP = "";
	    this.txtD = "";
	    this.index = _index;
	    this.dialogueHeight = _dialogueHeight;
	    this.finished = false;
        this.font = _font;
        this.fontSize = _fontSize;
        this.fontColor = _fontColor;
    }

    run() {
        if (this.txtP !== this.txt) {
            this.txtD = "";
            this.finished = false;
        }
        
        if (!this.finished && this.txtD.length() < this.txt.length()) {
            this.txtD += this.txt.charAt(this.txtD.length());
        } else if (this.txtD.length() === this.txt.length()) {
            this.finished = true;
        }
     
        textFont(this.font, this.fontSize);
        textAlign(CENTER);
        var x = width/2;
        var y = height-(this.dialogueHeight-(this.fontSize*(2+(this.index*2))));
        fill(0);
        text(this.txtD, x+2, y+2);
        fill(this.fontColor);        
        text(this.txtD, x, y);
        fill(255, 100);
        text(this.txtD, x-1, y-1);
        this.txtP = this.txt;
    }

}

