# sketches_numbers 数字系列  

给定数字序列，取余数，再按照数值对应不同颜色，画成方格，能画出什么图形？不同数列，不同画图方式，又能画出什么图形？

## 目前已有的代码

### 数字系列 numbers

对整数数列乘 `p`，或者用 `p` 的指数次幂，除以 `m` 取余数，填充颜色，画方格，得到图形。没有边框。

这个代码仓库的核心部分。

### 边框 border

加上不同粗细的边框，画出的图形有什么不同？

### 随机 random

随机不同类型参数，不用按顺序一个一个慢慢试。

## 关于 Processing

Processing 是一种开源的编程语言，也是一个开发环境，与多种常见的编程语言的区别是，输入代码就能直接画出各种想要的图形。默认 Java 模式。详见官网 [https://processing.org](https://processing.org)。

根据其项目地址 [https://github.com/processing/processing4](https://github.com/processing/processing4)，Processing 4 的许可证信息：

- 核心库遵循 [LGPLv2.1](https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html) 许可证
- Processing 开发环境遵循 [GPLv2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html) 许可证

如果只是用 Processing 作为工具创作的代码，一般可以自由选择许可证。

## 运行环境

建议使用 `Processing 4.3.2` 或更高版本。没有在其他版本上测试，不保证能在每个版本上正常运行。

Processing 最新版本下载地址：[https://processing.org/download](https://processing.org/download)

下载特定版本：[https://github.com/processing/processing4/releases](https://github.com/processing/processing4/releases)

## 运行方式

用 Git 克隆仓库：

```bash
git clone git@github.com:qp91mn64/sketches_numbers.git
```

或者点击绿底白字的 `Code` 按钮，选择 **Download ZIP**，下载 zip 文件，自行解压。 

代码经过整理，详见各二级目录的 `README.md` 和代码里的说明。  

一般而言，任选一份 `.pde` 文件，用 Processing 打开即可运行。  

## 许可证

本代码仓库采用 MIT 许可证。详见 [LICENSE](LICENSE)。

## 其他

原来不是有一堆图片吗，怎么只剩这么点了？跑哪里去了？  

为了便于维护，同时减少文件总数以及总大小，大多数图片都被去除了。  

不过可以通过 Git 回退到之前的版本查看所有曾经加到代码仓库里的图片。  
