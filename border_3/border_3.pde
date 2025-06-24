/**
  2025/6/24
  边框
  参考：numbers_3.pde
  三角形数的整数倍除以m的余数
  不同边框宽度也有不同视觉效果
  黑色的边框能调和强烈对比度的颜色
  边框宽度最好取奇数值，这样就没有中间颜色像素
  边框的宽度小于格子宽度和格子高度的较小值才有其他颜色
  strokeWeight(0)也能看出有很窄的边框
  由稍暗的颜色像素点组成
  */

int p = 1;
int w = 10;
int h = 10;
int a;
int m = 2;
int max_m = 10;
int border = 1;
String s;
void setup() {
  size(140, 140);
  strokeWeight(border);
  colorMode(HSB, m);
  fill(0, m, m);
  noLoop();
  //frameRate(1);
}
void draw() {
  int da = 0;
  int aa = 0;
  colorMode(HSB, m);
  a = 0;
  fill(a, m, m);
  // 问了AI,AI给出了String.format()
  s = String.format("初值0_除以%d的余数_三角形数的%d倍_格子尺寸%dx%d_边框宽度%d_%dx%d格.png", m, p, w, h, border, width/w, height/h);
  println(s);
  colorMode(HSB, m);
  for (int y = 0; y < height; y += h) {
    for (int x = 0; x < width; x += w) {
      rect(x, y, w, h);
      da += p;
      a += da;
        if (a > m) {
          a = a % m;
        }
      aa = a % m;
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
    println("图片已保存");
  } else {
    redraw();
  }
}
