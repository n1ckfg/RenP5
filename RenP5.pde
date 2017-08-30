GameManager gameManager;

void setup() {
  fullScreen(P2D);
  gameManager = new GameManager();
}

void draw() {
  background(0);
  gameManager.run();
}