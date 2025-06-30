/**
  2025/6/27 - 2025/6/30
  随机格子大小
  参考：numbers_1.pde
  
  p的整数倍除以m的余数
  格子往往比较小
  当格子很小的时候有可能看起来像是其他颜色
  
  点击鼠标左键更新参数p，m
  点击鼠标右键保存图形
  */
int p = 1;
int w;
int h;
int a;
int m = 2;
int max_m = 10;
String s;
void setup() {
  size(150, 100);
  w = int(1 + random(pow(width, 0.5)));
  h = int(1 + random(pow(height, 0.5)));
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
  s = String.format("初值0_除以%d的余数_%d的整数倍_格子尺寸%dx%d_%dx%d格.png", m, p, w, h, width/w, height/h);
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
    println("图片已保存");
  } else {
    redraw();
  }
}
