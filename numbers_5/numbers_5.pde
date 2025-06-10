int p = 1;
int w = 10;
int h = 10;
int a;
int m = 16;
int max_m = 10;
String s;
void setup() {
  size(500, 500);
  noStroke();
  colorMode(HSB, m);
  fill(0, m, m);
  noLoop();
  //frameRate(1);
}
void draw() {
  int da = 0;
  int da1 = 0;
  int aa = 0;
  colorMode(HSB, m);
  a = 0;
  fill(a, m, m);
  // 问了AI,AI给出了String.format()
  s = String.format("初值0_除以%d的余数_四面体数的%d倍_%dx%d格.png", m, p, width/w, height/h);
  println(s);
  for (int y = 0; y < height; y += h) {
    for (int x = 0; x < width; x += w) {
      rect(x, y, w, h);
      da += p;
      da1 += da;
      a += da1;
      // Java不能处理大于等于2**31的数字除非用type long,即2147483648L,不能处理大于等于2**63的数字除非用big numbers?
        if (a > m) {
          a = a % m;
        }
      aa = a % m;
      //println(a);
      fill(aa, m, m);
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
