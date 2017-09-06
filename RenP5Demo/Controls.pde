void keyPressed() {
  if (key == ' ') {
    renP5.script.sceneCounter++;
    if (renP5.script.sceneCounter >= renP5.scenes.length) renP5.script.sceneCounter = 0;
    println(renP5.script.sceneCounter);
  }
}