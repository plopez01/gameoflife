void gameLoop() {
  //Clear render buffer
  for (int x = 0; x < xSize; x++) {
    for (int y = 0; y < ySize; y++) {
      RENDER_BUFFER[x][y] = false;
    }
  }

  for (int x = 0; x < xSize; x++) {
    for (int y = 0; y < ySize; y++) {
      int cnt = 0;

      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          if ((x+i < 0 || x+i == xSize) || y+j < 0 || y+j == ySize) continue; //Check if we are not out of bounds
          if (i == 0 && j == 0) continue; // Don't count yourself, only check neighbours

          if (DATA_BUFFER[x+i][y+j]) cnt++; //<>//
        }
      }

      if (DATA_BUFFER[x][y]) {
        if (cnt == 2 || cnt == 3) RENDER_BUFFER[x][y] = true;
      } else {
        if (cnt == 3) RENDER_BUFFER[x][y] = true;
      }
    }
  }
  rndToDat();
}

void rndToDat() {
  //Copy render buffer to data buffer
  for (int x = 0; x < xSize; x++) {
    for (int y = 0; y < ySize; y++) {
      DATA_BUFFER[x][y] = RENDER_BUFFER[x][y];
    }
  }
}

void drawGird() {
  for (int x = 0; x < width; x += CELLSIZE) {
    line(x, 0, x, height);
  }

  for (int y = 0; y < height; y += CELLSIZE) {
    line(0, y, width, y);
  }
}

void clearCells() {
  for (int x = 0; x < xSize; x++) {
    for (int y = 0; y < ySize; y++) {
      RENDER_BUFFER[x][y] = false;
      DATA_BUFFER[x][y] = false;
    }
  }
}

void drawCells() {
  for (int x = 0; x < width; x += CELLSIZE) {
    for (int y = 0; y < height; y += CELLSIZE) {
      if (RENDER_BUFFER[x/CELLSIZE][y/CELLSIZE]) square(x, y, CELLSIZE);
    }
  }
}
