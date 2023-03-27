function OutputName = Recognition(TestImage, m, A, Eigenfaces)


ProjectedImages = [];
for i = 1 : 20
    temp = Eigenfaces'*A(:,i); %e将每个样本投影到特征空间
    ProjectedImages = [ProjectedImages temp]; 
end

%%%%%%%%%%%%%%%%%%%%%%%% 从测试样本库计算提取特征
InputImage = imread(TestImage);
InputImage = rgb2gray(InputImage); %转为灰度
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; 
ProjectedTestImage = Eigenfaces'*Difference; % 将待测样本投影到特征空间

%%%%%%%%%%%%%%%%%%%%%%%% 按照欧式距离取最小的原则得出匹配的样本


Euc_dist = [];
for i = 1 : 20
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end
%按照欧几里得距离进行升序
[Euc_dist_asc , Recognized_index_asc] = sort(Euc_dist);
%获取该样本的数字代号
BestMatch = strcat(int2str(Recognized_index_asc(1)),'.bmp');
SecondaryMatch = strcat(int2str(Recognized_index_asc(2)),'.bmp');
BestMatchDist = Euc_dist_asc(1);
if BestMatchDist == 0
    OutputName = [string(BestMatch)];
else
    OutputName = [string(BestMatch), string(SecondaryMatch)];
end

% %选取最小欧式距离的样本
% [Euc_dist_min , Recognized_index] = min(Euc_dist);
% %获取该样本的数字代号
% OutputName = strcat(int2str(Recognized_index),'.bmp');