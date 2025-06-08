int p = 1;
int w = 10;
int h = 10;
int a;
int f = 1;
int m = 67;
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
  //先更新颜色范围在填充颜色否则会导致最左上角格子颜色的不一致。
  //对于colorMode(HSB, m); 无论m是什么值fill(0, m, m)都是红色(RGB(255, 0, 0))无影响；但是对于此处不是红色就会影响。
  colorMode(HSB, m);
  a = 1;
  f = 1;
  int fig = 1;
  fill(p*a, m, m);
  // 问了AI,AI给出了String.format()
  s = String.format("初值%d_除以%d的余数_斐波那契数列的%d倍_%dx%d格.png",a, m, p, width/w, height/h);
  println(s);
  for (int y = 0; y < height; y += h) {
    for (int x = 0; x < width; x += w) {
      rect(x, y, w, h);
      fig = f;
      f += a;
      a = fig;
      if (a > m) {a = a % m;}
      //println(a);
      fill(p*a%m, m, m);
  }}
  //saveFrame(s);
  p++;
  if (p == m) {
    p = 1;
    m++;}
  if (m == 10) {noLoop();}
}
void mousePressed() {if (mouseButton == RIGHT) {saveFrame(s);} else{redraw();}}
