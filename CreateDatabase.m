function T = CreateDatabase(TrainDatabasePath) 
%函数功能：把二维图像变为一维列向量用于构造T
%TrainDatabasePath是训练集路径
%返回值T是一个二维矩阵，若有P张M*N的图像，则T为M*N行P列的矩阵
%%%%%%%读取训练库路径，并统计样本个数

TrainFiles = dir(TrainDatabasePath);%训练集路径，将2维图像转化为一维向量
fprintf('依据此路径->%s ,生成样本数据库 \n', TrainDatabasePath);

% T = [];%初始化
% ImageFiles = dir(TrainDatabasePath);
% ImageFilePaths = [];
% for index = 1: length(ImageFiles)
%     curImageFileName = ImageFiles(index).name;
%     %匹配文件时排除.以及..
%     if(isequal(curImageFileName, '.') || isequal(curImageFileName, '..'))
%         continue
%     end
%     if(endsWith(curImageFileName, 'bmp'))
%         %处理我们想要处理的图片
% 
%         %STEP1.字符串拼接，得到每一张训练图片的完整路径。
%         curImagePath = strcat(TrainDatabasePath, '\', curImageFileName);
%         fprintf('读取训练集文件->%s \n', curImagePath);
%         ImageFilePaths = [ImageFilePaths, ];
% 
%         %STEP2.读入训练图片
%         img = imread(curImagePath);
% 
%         %STEP3.灰度处理
%         img = rgb2gray(img);
% 
%         %STEP4.得到图片大小,并且二维图片转为一维向量
%         [irow icol] = size(img);
%         temp = reshape(img',irow*icol,1);
% 
%         %STEP5.输出|每张图片的信息做为T的一列   
%         T = [T temp];
% 
%         sort(ImageFilePaths);
%     end
% end





T = [];%初始化
for i = 1 : 20%批量处理图片
%获取图像的数字代号
%读取训练集每一个图像，得到其尺寸，初始化图形矩阵。

    str = int2str(i);%将整数数据转换为字符串   
    str = strcat('\',str,'.bmp');%字符串拼接,得到\i.bmp
    str = strcat(TrainDatabasePath,str);%字符串拼接，得到每一张训练图片的完整路径。

    img = imread(str);%读入训练图片
    img = rgb2gray(img); %转为灰度

    [irow icol] = size(img);%得到图片大小

    temp = reshape(img',irow*icol,1);  %将二维图片转为一维向量
    T = [T temp];     % 每张图片的信息做为T的一列   
end