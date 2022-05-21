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
  
  if (key == 'r' || key == 'R') {
    if(running) return;
    for (int x = 0; x < xSize; x++) {
      for (int y = 0; y < ySize; y++) {
        RENDER_BUFFER[x][y] = random(1) < 0.5;
      }
    }
  }
  
  if (key == ' ') {
    running = !running;
    rndToDat();
  }
}
