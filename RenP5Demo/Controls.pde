void keyPressed() {
  if (key == ' ') {
    renP5.sceneCounter++;
    if (renP5.sceneCounter >= renP5.scenes.length) renP5.sceneCounter = 0;
    println(renP5.sceneCounter);
  }
}