int p = 1;
int w = 10;
int h = 10;
int a;
int m = 2;
int max_m = 10;
String s;
void setup() {
  size(100, 100);
  noStroke();
  colorMode(HSB, m);
  fill(0, m, m);
  noLoop();
  //frameRate(1);
}
void draw() {
  fill(0, m, m);
  a = 0;
  // 问了AI,AI给出了String.format()
  s = String.format("初值0_除以%d的余数_%d的整数倍_%dx%d格.png", m, p, width/w, height/h);
  println(s);
  colorMode(HSB, m);
  for (int y = 0; y <= height - h; y += h) {
    for (int x = 0; x <= width - w; x += w) {
      rect(x, y, w, h);
      a += p;
      if (a > m) {
        a = a % m;
      }
      fill(a, m, m);
    }
  }
  //saveFrame(s);
  p++;
  if (p >= m) {
    p = 1;
    m++;
  }
  if (m > max_m) {
    noLoop();
  }
}
void mousePressed() {
  if (mouseButton == RIGHT) {
    saveFrame(s);
  } else {
    redraw();
  }
}
