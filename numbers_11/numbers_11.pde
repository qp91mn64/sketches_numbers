/**
 2025/7/3
 (a1*n+a0) % m
 
 与numbers_1.pde相比
 采取新的结构
 把计算与画图分开成不同函数
 相应地，保存和更新过程也分开成函数
 画图部分只用一个for循环
 用boolean变量chromatic控制画彩色还是黑白
 a1是一次项
 a0是常数项
 n0是初始值
 从而消除numbers_1.pde中初值一词的歧义
 boolean变量multiple控制是否批量保存图形
 批量保存图形主要部分也用一个函数saveMultipleImages(saveMax)实现
 
 使用方式：
 可以画彩色或黑白
 要画彩色设置chromatic = true
 控制台查看信息
 要批量保存图形就设置multiple = true
 调整cols，rows实现不同视觉效果
 注意cellWidth或cellHeight是小数时边界上有其他颜色的像素点
 */
int cols = 10;  // 数值矩阵一行元素个数
int rows = 10;  // 数值矩阵一列元素个数
float cellWidth;  // 格子宽度
float cellHeight;  // 格子高度
int a1 = 1;  // 一次项系数，大于等于m时效果与除以m的余数相同
int a0 = 0;  // 常数项，大于等于m时效果与除以m的余数相同
int m = 100;  // 除以m取余数
int n0 = 0;  // 初始值
int nMin = n0;
int nMax = n0 + cols * rows - 1;
int saveMax = 10;  // 批量保存图片的m最大值
int[][] valueArray = new int[cols][rows];  // 计算出的数值在这里
String s;
boolean chromatic = false;  // 是否画彩色
boolean multiple = false;  // 是否批量保存图形
void setup() {
  size(100, 100);
  cellWidth = width / float(cols);
  cellHeight = height / float(rows);
  noStroke();
  if (multiple == false) {
    noLoop();
  }
  //frameRate(1);
}
void draw() {
  if (multiple == true) {
    saveMultipleImages(saveMax);
  } else {
    calculateValues(m);
    drawValues(chromatic, m, a1, a0);
    //saveImage();
    //update();
  }
}
void mousePressed() {
  if (mouseButton == LEFT) {
    update();
    redraw();
  } else {
    saveImage();
  }
}
int[][] calculateValues(int m) {
  for (int n = 0; n < cols * rows; n++) {
    int x = n % cols;
    int y = n / cols;
    valueArray[x][y] = (a1 * (n + n0) + a0) % m;
  }
  return valueArray;
}
void drawValues(boolean chromatic, int m, int a1, int a0) {
  String s1;
  if (chromatic == true) {
    colorMode(HSB, m);
    s1 = "彩色";
  } else {
    colorMode(RGB, m-1);
    s1 = "黑白";
  }
  s = String.format("除以%d的余数_%dn+%d_n的范围%d到%d_", m, a1, a0, nMin, nMax) + s1 + String.format("_画布尺寸%dx%d_%dx%d格", width, height, cols, rows);
  println(s);
  for (int n = 0; n < cols * rows; n++) {
    int x = n % cols;
    int y = n / cols;
    if (chromatic == true) {
      fill(valueArray[x][y], m, m);
    } else {
      fill(valueArray[x][y]);
    }
    rect(cellWidth*x, cellHeight*y, cellWidth, cellHeight);
  }
}
void saveImage() {
  saveFrame(s.concat(".png"));
  println("图片已保存");
}
void update() {
  a1++;
  if (a1 >= m) {
    a1 = 1;
    m++;
  }
}
void saveMultipleImages(int saveMax) {
  while (m <= saveMax) {
    calculateValues(m);
    drawValues(chromatic, m, a1, a0);
    saveImage();
    update();
  }
}
