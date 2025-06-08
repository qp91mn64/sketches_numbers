int p = 2;
int w = 10;
int h = 10;
int a;
int m = 32;
String s;
void setup() {
  size(210, 500);
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
  // 问了AI,AI给出了String.format()
  s = String.format("初值%d_整数的%d次方_除以%d的余数_%dx%d格.png",a, p, m, width/w, height/h);
  println(s);
  for (int y = 0; y < height; y += h) {
    for (int x = 0; x < width; x += w) {
      int aa = a;
      for (int b = 1; b < p; b++){
        aa *= a;
        if (aa> m) {aa = aa % m;}
      }
      //println(aa);
      fill(aa%m, m, m);
      rect(x, y, w, h);
      a++;
  }}
  //saveFrame(s);
  p++;
  if (p == m) {
    p = 1;
    m++;}
  //if (m == 101) {noLoop();}
}
void mousePressed() {if (mouseButton == RIGHT) {saveFrame(s);} else{redraw();}}
