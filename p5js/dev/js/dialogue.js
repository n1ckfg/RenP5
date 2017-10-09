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

