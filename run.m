clear all
clc
close all

%自定义和设置初始目录路径
TrainDatabasePath = uigetdir(strcat(matlabroot,'\work'), '选择训练样本库' );
TestDatabasePath = uigetdir(strcat(matlabroot,'\work'), '选择测试样本库');

%读取宠物库的路径
prompt = {'输入测试图片数字代表1-20'};
dlg_title = '昆虫识别系统';
num_lines= 1;
def = {'1'};

TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.bmp');
im = imread(TestImage);
%返回的数组A包含图像数据。
%若文件包含灰色图像，A是M*N的数组；若文件包含真彩色图像，A是M*N*3的数组。

% 创建昆虫数据库
T = CreateDatabase(TrainDatabasePath);%根据训练图片路径生成2维矩阵
[m, A, Eigenfaces,D] = EigenfaceCore(T);%生成特征量
OutputName = Recognition(TestImage, m, A, Eigenfaces);

% 选择需要识别的图片
SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

% 显示图片
figure;
subplot(1,2,1);imshow(im);
title('测试图片');
subplot(1,2,2);imshow(SelectedImage);
title('库内匹配昆虫');
%输出识别昆虫的数字代号
str = strcat('匹配图片： :  ',OutputName);
disp(str)

%结果输出
if strcmp(OutputName,'1.bmp') | strcmp(OutputName,'2.bmp') |  strcmp(OutputName,'3.bmp') |  strcmp(OutputName,'4.bmp')
    msgbox('识别结果是蝴蝶！');
elseif strcmp(OutputName,'5.bmp') | strcmp(OutputName,'6.bmp') |  strcmp(OutputName,'7.bmp') |  strcmp(OutputName,'8.bmp')
    msgbox('识别结果是螳螂！');
elseif strcmp(OutputName,'9.bmp') | strcmp(OutputName,'10.bmp') |  strcmp(OutputName,'11.bmp') |  strcmp(OutputName,'12.bmp')
    msgbox('识别结果是七星瓢虫！');
elseif strcmp(OutputName,'13.bmp') | strcmp(OutputName,'14.bmp') |  strcmp(OutputName,'15.bmp') |  strcmp(OutputName,'16.bmp')
    msgbox('识别结果是蜜蜂！');
elseif strcmp(OutputName,'17.bmp') | strcmp(OutputName,'18.bmp') |  strcmp(OutputName,'19.bmp') |  strcmp(OutputName,'20.bmp')
    msgbox('识别结果是蚂蚁！');
end
