# 专利申请的Latex模板
## 使用说明
这是一个用于撰写专利申请文件的基于 LaTex 专利申请模板。
在以往已经长期使用了几年了，但是考虑到国知局推动专利申请文件 xml 化的进程逐渐加速，由于不存在从 LaTex 到 xml 或 Word 的无损转换，该模板已经逐步放弃，现公开出来，供其他人参考。
### 编译选项与文件选择
本项目在生成 pdf 文件时，选择 XeLaTex 引擎，使用其他引擎编译会出错。
### 附图标记与文档变量
#### 附图标记
附图标记保存在 numbering.csv 中，在其他的章节文件中被引用，因此只需要在 numbering.csv 中更新全部的附图标记。
#### 文档变量
文档变量存储于 patvar.tex 中，定义了申请类型、申请名称以及主题名称等。
### 附图引用
所有的附图保存在 figures 文件夹下，以 `figure*.png` 依次编号命名，在《说明书附图》章节由一个循环自动调用，在编译时自动更新附图。
但是，作者需要维护一个图片数量的变量，这一变量在`100003-figure4desc.tex`中定义，需要修改下面的数值：
```
%修改这里的数字确定附图数量
\def\fignum{3}
```
此外，在预览时为了正确地引用图片，还需要修改《说明书》`100002-description.tex`中的内容：
```
%修改这里的数字确定附图数量
\def\fignum{3}
```
### 宏定义与格式控制
主要在`main.tex`与`100002-description.tex`中开头的位置定义了一些宏，这些宏用于控制编译后的 pdf 文件格式。具体的，
```
%控制注释是否显示，默认是显示注释的
%将下一行注释掉，则不显示草稿的注释
\def\DRAFT{}       
%控制说明书行号是否显示
%将下一行注释掉，则不显示行号
\def\DRAFTNUM{}     
% 控制是否显示修订的内容
% 将下一行注释掉，则不显示修订的内容，以最终的版本显示
\def\REV{}
```
### 命令行编译
在项目文件夹下(Application目录)运行
```
latexmk -pvc -xelatex *.tex
```

其中，`main.tex`用于生成完整的申请文件，即五书的整合，`100001-claim.tex`用于生成权利要求书，`100002-description.tex`用于生成说明书，`100003-figure4desc.tex`用于生成说明书附图，`100004-abstract.tex`用于生成说明书摘要，`100005-figure4abstract.tex`用于生成摘要附图。


### 目录结构说明
```
APPLICATION
│  100001-claim.tex  #权利要求书源文件
│  100002-description.tex  #说明书源文件
│  100003-figure4desc.tex  #说明书附图源文件
│  100004-abstract.tex  #说明书摘要源文件
│  100005-figure4abstract.tex  #摘要附图源文件
│  clean.lua  #用于清理目录的lua脚本，需要安装luafilesystem库
│  main.tex  #用于生成全文的源文件，是引用上面的源文件，最多只需要修改里面的宏定义即可
│  numbering.csv  #附图标记定义文件
│  numberingNoShow.csv  #目前可以不用
│  patstyle.tex  #格式定义文件
│  patvar.tex  #文档变量定义文件
└─figures  #附图目录
        figure*.png  #附图
```
### 其他
支持表格、数学公式等。

一些文档中需要用到的自定义命令需要对照 `patstyle.tex`。包括文档修订命令、文档注释命令、附图编号引用命令以及文档变量掉用命令等。 
