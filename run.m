clear all
clc
close all

%自定义和设置初始目录路径
% TrainDatabasePath = uigetdir(strcat(matlabroot,'\work'), '选择训练样本库' );
% fprintf('训练集路径->%s\n', TrainDatabasePath)
% TestDatabasePath = uigetdir(strcat(matlabroot,'\work'), '选择测试样本库');
% fprintf('测试集路径->%s\n', TrainDatabasePath)
TrainDatabasePath = 'H:\bugs-recogn\BugsRecogn\TrainDatabase';
TestDatabasePath = 'H:\bugs-recogn\BugsRecogn\TestDatabase';

%读取宠物库的路径
prompt = {'输入测试图片数字代表1-20'};
dlg_title = '昆虫识别系统';
num_lines= 1;
def = {'1'};

%让用户选择[测试集中]需要进行匹配的图片
TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.bmp');
im = imread(TestImage);
%返回的数组A包含图像数据。
%若文件包含灰色图像，A是M*N的数组；若文件包含真彩色图像，A是M*N*3的数组。

%创建昆虫数据库
T = CreateDatabase(TrainDatabasePath);%根据训练图片路径生成2维矩阵
[m, A, Eigenfaces,D] = EigenfaceCore(T);%生成特征量

%开始识别，输出最佳匹配
MatchedImags = Recognition(TestImage, m, A, Eigenfaces);

%默认匹配度最高图片
FirstMatchImg = strcat(TrainDatabasePath,'\',MatchedImags(1));
FirstMatchImg = imread(FirstMatchImg);
FirstMatchImgName = MatchedImags(1);

%是否有最佳匹配
OutputSize = length(MatchedImags);
haveBestMatch = OutputSize == 1;

%根据是否有最佳匹配，改变输出模式
showingCols = 3;
if haveBestMatch
    showingCols = 2;
end

% 显示图片
figure;
subplot(1,showingCols,1);imshow(im);
title('测试图片');
subplot(1,showingCols,2);imshow(FirstMatchImg);
title('库内最佳匹配');

%如果没有最佳匹配，说明匹配度不够高，输出次佳匹配
if (~haveBestMatch)
    SecMatchImg = strcat(TrainDatabasePath,'\',MatchedImags(2));
    SecMatchImg = imread(SecMatchImg);
    subplot(1,showingCols,3);imshow(SecMatchImg);
    title('库内次佳匹配');
end

%输出识别昆虫的数字代号
str = strcat('匹配图片： :  ',FirstMatchImgName);
disp(str)

%结果输出
if strcmp(FirstMatchImgName,'1.bmp') | strcmp(FirstMatchImgName,'2.bmp') |  strcmp(FirstMatchImgName,'3.bmp') |  strcmp(FirstMatchImgName,'4.bmp')
    msgbox('识别结果是蝴蝶！');
elseif strcmp(FirstMatchImgName,'5.bmp') | strcmp(FirstMatchImgName,'6.bmp') |  strcmp(FirstMatchImgName,'7.bmp') |  strcmp(FirstMatchImgName,'8.bmp')
    msgbox('识别结果是螳螂！');
elseif strcmp(FirstMatchImgName,'9.bmp') | strcmp(FirstMatchImgName,'10.bmp') |  strcmp(FirstMatchImgName,'11.bmp') |  strcmp(FirstMatchImgName,'12.bmp')
    msgbox('识别结果是七星瓢虫！');
elseif strcmp(FirstMatchImgName,'13.bmp') | strcmp(FirstMatchImgName,'14.bmp') |  strcmp(FirstMatchImgName,'15.bmp') |  strcmp(FirstMatchImgName,'16.bmp')
    msgbox('识别结果是蜜蜂！');
elseif strcmp(FirstMatchImgName,'17.bmp') | strcmp(FirstMatchImgName,'18.bmp') |  strcmp(FirstMatchImgName,'19.bmp') |  strcmp(FirstMatchImgName,'20.bmp')
    msgbox('识别结果是蚂蚁！');
end


% 
% % 创建昆虫数据库
% T = CreateDatabase(TrainDatabasePath);%根据训练图片路径生成2维矩阵
% [m, A, Eigenfaces,D] = EigenfaceCore(T);%生成特征量
% FirstMatchImg = Recognition(TestImage, m, A, Eigenfaces);
% 
% % 选择需要识别的图片
% SelectedImage = strcat(TrainDatabasePath,'\',FirstMatchImg);
% SelectedImage = imread(SelectedImage);
% 
% % 显示图片
% figure;
% subplot(1,2,1);imshow(im);
% title('测试图片');
% subplot(1,2,2);imshow(SelectedImage);
% title('库内匹配昆虫');
% %输出识别昆虫的数字代号
% str = strcat('匹配图片： :  ',FirstMatchImg);
% disp(str)
% 
% %结果输出
% if strcmp(FirstMatchImg,'1.bmp') | strcmp(FirstMatchImg,'2.bmp') |  strcmp(FirstMatchImg,'3.bmp') |  strcmp(FirstMatchImg,'4.bmp')
%     msgbox('识别结果是蝴蝶！');
% elseif strcmp(FirstMatchImg,'5.bmp') | strcmp(FirstMatchImg,'6.bmp') |  strcmp(FirstMatchImg,'7.bmp') |  strcmp(FirstMatchImg,'8.bmp')
%     msgbox('识别结果是螳螂！');
% elseif strcmp(FirstMatchImg,'9.bmp') | strcmp(FirstMatchImg,'10.bmp') |  strcmp(FirstMatchImg,'11.bmp') |  strcmp(FirstMatchImg,'12.bmp')
%     msgbox('识别结果是七星瓢虫！');
% elseif strcmp(FirstMatchImg,'13.bmp') | strcmp(FirstMatchImg,'14.bmp') |  strcmp(FirstMatchImg,'15.bmp') |  strcmp(FirstMatchImg,'16.bmp')
%     msgbox('识别结果是蜜蜂！');
% elseif strcmp(FirstMatchImg,'17.bmp') | strcmp(FirstMatchImg,'18.bmp') |  strcmp(FirstMatchImg,'19.bmp') |  strcmp(FirstMatchImg,'20.bmp')
%     msgbox('识别结果是蚂蚁！');
% end

