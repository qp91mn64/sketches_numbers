/**
  2025/6/24
  随机
  参考：numbers_6.pde
  整数的p次方除以m的余数
  p和m的值是随机的
  不用于批量保存图形
  */
int w = 10;
int h = 10;
int m = int(random(2, width * height / w / h + 1));
int p = int(random(1, m));
int a;
String s;
void setup() {
  size(100, 100);
  noStroke();
  colorMode(HSB, m);
  fill(0, m, m);
  noLoop();
}
void draw() {
  a = 1;
  // 问了AI,AI给出了String.format()
  s = String.format("初值0_除以%d的余数_整数的%d次方_%dx%d格.png", m, p, width/w, height/h);
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
}
void mousePressed() {
  if (mouseButton == RIGHT) {
    saveFrame(s);
    println("图片已保存");
  } else {
    m = int(random(2, width * height / w / h + 1));
    p = int(random(1, m));
    colorMode(HSB, m);
    redraw();
  }
}
