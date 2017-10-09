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
            this.url = "actors/" + _name + "/" + _name + "_main.png";            
        } else if (this.type === "scene") {
            this.scaleToFit = true;
            this.url = "scenes/" + _name + ".png";            
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

