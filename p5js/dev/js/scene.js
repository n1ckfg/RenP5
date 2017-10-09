class Scene extends Sprite {
    
    constructor(_name) {
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

