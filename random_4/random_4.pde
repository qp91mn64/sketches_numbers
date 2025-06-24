/**
  2025/6/24
  随机
  参考：numbers_4.pde
  完全平方数的整数倍除以m的余数
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
  int da = 0;
  int aa = 0;
  a = 0;
  fill(a, m, m);
  // 问了AI,AI给出了String.format()
  s = String.format("初值0_除以%d的余数_完全平方数的%d倍_%dx%d格.png", m, p, width/w, height/h);
  println(s);
  for (int y = 0; y <= height - h; y += h) {
    for (int x = 0; x <= width - w; x += w) {
      rect(x, y, w, h);
      da ++;
      a = p * (da * da % m);
        if (a > m) {
          a = a % m;
        }
      aa = a % m;
      fill(aa, m, m);
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
