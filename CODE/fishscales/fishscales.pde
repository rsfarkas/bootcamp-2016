int x = 0;
int y =0;

void setup() {
  size(600, 800);
  smooth();
}

void draw() {
  for (int x = 0; x<=width; x+=20) {
    for (int y=0; y<=height; y+=20) {
      fill(255);
      ellipse(x, y, 40, 40);
      fill(204, 255, 204);
      ellipse(x, y, 30, 30);
    }
  }
}