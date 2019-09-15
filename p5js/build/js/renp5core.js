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

