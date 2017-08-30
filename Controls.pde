void keyPressed() {
  if (key == ' ') {
    gameManager.sceneCounter++;
    if (gameManager.sceneCounter >= gameManager.scenes.size()) gameManager.sceneCounter = 0;
  }
}