void checkCells() {
  if (!mousePressed) return;

  int xCell = mouseX/CELLSIZE;
  int yCell = mouseY/CELLSIZE;

  if (xCell >= xSize || yCell >= ySize) return;
  if (xCell < 0 || yCell < 0) return;

  if (mouseButton == LEFT) {
    RENDER_BUFFER[xCell][yCell] = true;
  } else if (mouseButton == RIGHT) {
    RENDER_BUFFER[xCell][yCell] = false;
  }
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    clearCells();
  }
  if (key == ' ') {
    running = !running;
    rndToDat();
  }
}
