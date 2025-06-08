int p = 1;
int w = 10;
int h = 10;
int a;
int m = 2;
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
  int da = 0;
  int aa = 0;
  //先更新颜色范围在填充颜色否则会导致最左上角格子颜色的不一致。
  //对于colorMode(HSB, m); 无论m是什么值fill(0, m, m)都是红色(RGB(255, 0, 0))无影响；但是对于此处不是红色就会影响。
  colorMode(HSB, m);
  a = 0;
  fill(a, m, m);
  // 问了AI,AI给出了String.format()
  s = String.format("初值%d_除以%d的余数_完全平方数的%d倍_%dx%d格.png",a, m, p, width/w, height/h);
  println(s);
  for (int y = 0; y < height; y += h) {
    for (int x = 0; x < width; x += w) {
      rect(x, y, w, h);
      //println(a);
      da ++;
      a = p * da * da;
      //if (a > m) {a = a % m;}
      aa = a % m;
      println(a);
      fill(aa, m, m);
  }}
  //saveFrame(s);
  p++;
  if (p == m) {
    p = 1;
    m++;}
  if (m == 6) {noLoop();}
}
void mousePressed() {if (mouseButton == RIGHT) {saveFrame(s);} else{redraw();}}
