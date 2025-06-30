/**
  2025/6/21 - 2025/6/30
  边框
  从numbers_6.pde改动而来
  还是整数的p次幂除以m的余数
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
int border = 9;
String s;
void setup() {
  size(100, 100);
  strokeWeight(border);
  //noStroke();
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
  s = String.format("初值1_除以%d的余数_整数的%d次方_格子尺寸%dx%d_边框宽度%d_%dx%d格.png", m, p, w, h, border, width/w, height/h);
  println(s);
  for (int y = 0; y <= height - h; y += h) {
    for (int x = 0; x <= width - w; x += w) {
      int aa = a;
      for (int b = 1; b < p; b++) {
        aa *= a;
        if (aa > m) {
          aa = aa % m;
        }
      }
      //println(aa);
      fill(aa%m, m, m);
      rect(x, y, w, h);
      a++;
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
