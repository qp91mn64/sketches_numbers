/** 2025/6/19
  二次函数式子的p倍 
  p * (a2 * n * n + a1 * n + a0)
  
  随机颜色，黑白或高饱和度的彩色
  
  点击鼠标左键随机设置式子里的参数a2、a1、a0，点击鼠标右键保存图形
  按下数字1键画下一张图形，按下2键画上一张图形
  按下3则参数a2加1，按下4则参数a2减1
  按下5则参数a1加1，按下6则参数a1减1
  按下7则参数a0加1，按下8则参数a0减1
  
  由于随机参数设置
  这里没有设置批量保存图形的功能
  只是仍然设置能自动保存图形
  可以选择黑白或彩色模式
  */
  
int a0 = 0;
int a1 = 1;
int a2 = 2;
int p = 1;
int w = 10;
int h = 10;
int a;
int m = 2;
color[] c;
String s;
void setup() {
  size(100, 100);
  noStroke();
  colorMode(HSB, 360, 255, 255);
  noLoop();
  newColor(m);
}
void draw() {
  // 问了AI,AI给出了String.format()
  s = String.format("除以%d的余数_%d倍_%dn2+%dn+%d_%dx%d格.png", m, p, a2, a1, a0, width/w, height/h);
  println(s);
  for (int n = 0; n < (width/w) * (height/h); n++) {
    a = calculate(n, p, a2, a1, a0, m);
    fill(c[a]);
    rect((n % (width/w))*w, (n / (width/w))*h, w, h);
  }
  //saveFrame(s);  // 取消注释就能自动保存图形
}
void mousePressed() {
  if (mouseButton == RIGHT) {
    saveFrame(s);
    println("图片已保存");
  } else {
    a2 = int(random(m));
    a1 = int(random(m));
    a0 = int(random(m));
    println("a2:", a2, "a1:", a1, "a0:", a0);
    redraw();
  }
}
void keyPressed() {
  switch (key) {
    case '1':
      p++;
      if (p >= m) {
        p = 1;
        m++;
        newColor(m);
      }
      redraw();
      break;
    case '2':
      if (m > 2) {
        p--;
        if (p <= 0) {
          m--;
          p = m-1;
          newColor(m);
        }
      }
      redraw();
      break;
    case '3':
      a2++;
      redraw();
      break;
    case '4':
      if (a2 > 0) {
        a2--;
      }
      redraw();
      break;
    case '5':
      a1++;
      redraw();
      break;
    case '6':
      if (a1 > 0) {
        a1--;
      }
      redraw();
      break;
    case '7':
      a0++;
      redraw();
      break;
    case '8':
      if (a0 > 0) {
        a0--;
      }
      redraw();
      break;
  }
}
int calculate(int n, int p, int a2, int a1, int a0, int m) {
  int f = p * (a0 + n * (a1 + n * a2));
  return f % m;
}
void newColor(int m) {
  c = new color[m];
  for (int i = 0; i < m; i++) {
    // c[i] = color(random(360));  // 画黑白
    // println(brightness(c[i]));  // 如果画黑白可以查看这个
    c[i] = color(random(360), 255, 255);  // 画高饱和度彩色
    println(hue(c[i]));  // 如果画高饱和度彩色查看这个
  }
}
