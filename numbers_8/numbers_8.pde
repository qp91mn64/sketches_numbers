/** 2025/6/10
  * 二次函数式子的p倍 
  * p * (a2 * n * n + a1 * n + a0)
  * 点击鼠标左键更新参数，先使p加1，加到比m小于1时再加置1同时m加1
  * 可以设置最大max_m用于批量保存图形时的终止条件
  * 可以选择黑白或彩色模式
  * 
  */
  
int a0 = 0;
int a1 = 1;
int a2 = 2;
int p = 1;
int w = 10;
int h = 10;
int a;
int m = 2;
int max_m = 20;
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
  // 问了AI,AI给出了String.format()
  s = String.format("除以%d的余数_%d倍_%dn2+%dn+%d_%dx%d格.png", m, p, a2, a1, a0, width/w, height/h);
  println(s);
  colorMode(HSB, m);
  //colorMode(RGB, m-1); // 最大值m-1对应于白色
  for (int n = 0; n < (width/w) * (height/h); n++) {
    a = calculate(n, p, a2, a1, a0, m);
    fill(a, m, m); // 用于colorMode(HSB, m);
    // fill(a); // 用于colorMode(RGB, m-1);
    rect((n % (width/w))*w, (n / (width/w))*h, w, h);
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
int calculate(int n, int p, int a2, int a1, int a0, int m) {
  int f = p * (a2 * n * n + a1 * n + a0);
  return f % m;
}
