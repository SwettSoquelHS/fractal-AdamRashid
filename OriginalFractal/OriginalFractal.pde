int angle= 0;
int colorR = (int) random(0, 255);
int colorG = (int) random(0, 255);
int colorB = (int) random(0, 255);
void setup() {
  size(800, 800);
  rectMode(CENTER);
}

void draw() {
  background(150);
  drawSquares(width/2, height/2, 500, angle, colorR, colorG, colorB);
  angle++;
}
void drawSquares(float x, float y, float r, float rot, float colorR, float colorG, float colorB) {
  pushMatrix();
  fill(colorR, colorG, colorB);
  translate(x, y);
  rotate(radians(rot));
  rect(0, 0, r, r);

  if (r > 20) {
    drawSquares(10, 10, 0.5*r, -1 * rot, colorR * .8, colorG * .8, colorB * .8);
    drawSquares(-10, 10, 0.5*r, rot, colorR * .8, colorG * .8, colorB * .8);
    drawSquares(-10, -10, 0.5*r, -1* rot, colorR * .8, colorG * .8, colorB * .8);
    drawSquares(10, -10, 0.5*r, rot, colorR * .8, colorG * .8, colorB * .8);
  }
  popMatrix();
}
void drawTree(float x, float y, float l, float a) {
  pushMatrix();
  translate(x, y);
  rotate(radians(a));
  line(0, 0, l, 0);  
  if (l>5) {
    drawTree(l, 0, 0.75*l, a + 10);
    drawTree(l, 0, 0.75*l, a - 10);
  }
  popMatrix();
}

void mousePressed(){
  colorR = (int) random(0, 255);
  colorG = (int) random(0, 255);
  colorB = (int) random(0, 255);
}
