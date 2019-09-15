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

