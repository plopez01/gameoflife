int CELLSIZE = 20;
int runSpeed = 5;

int xSize;
int ySize;

long frame = 0;

boolean[][] RENDER_BUFFER;
boolean[][] DATA_BUFFER;


boolean running = false;

void setup() {
  size(600, 600);
  xSize = width/CELLSIZE;
  ySize = height/CELLSIZE;

  RENDER_BUFFER = new boolean[xSize][ySize];
  DATA_BUFFER = new boolean[xSize][ySize];
  stroke(50);

  clearCells();
}

void draw() {
  background(0);
 
  drawGird();
  drawCells();

  if (running) {
    frameRate(runSpeed);
    gameLoop();
    frame++;
  } else {
    frameRate(60);
    checkCells();
  }
}
