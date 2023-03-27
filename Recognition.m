function OutputName = Recognition(TestImage, m, A, Eigenfaces)


ProjectedImages = [];
for i = 1 : 20
    temp = Eigenfaces'*A(:,i); %e��ÿ������ͶӰ�������ռ�
    ProjectedImages = [ProjectedImages temp]; 
end

%%%%%%%%%%%%%%%%%%%%%%%% �Ӳ��������������ȡ����
InputImage = imread(TestImage);
InputImage = rgb2gray(InputImage); %תΪ�Ҷ�
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; 
ProjectedTestImage = Eigenfaces'*Difference; % ����������ͶӰ�������ռ�

%%%%%%%%%%%%%%%%%%%%%%%% ����ŷʽ����ȡ��С��ԭ��ó�ƥ�������


Euc_dist = [];
for i = 1 : 20
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end
%����ŷ����þ����������
[Euc_dist_asc , Recognized_index_asc] = sort(Euc_dist);
%��ȡ�����������ִ���
BestMatch = strcat(int2str(Recognized_index_asc(1)),'.bmp');
SecondaryMatch = strcat(int2str(Recognized_index_asc(2)),'.bmp');
BestMatchDist = Euc_dist_asc(1);
if BestMatchDist == 0
    OutputName = [string(BestMatch)];
else
    OutputName = [string(BestMatch), string(SecondaryMatch)];
end

% %ѡȡ��Сŷʽ���������
% [Euc_dist_min , Recognized_index] = min(Euc_dist);
% %��ȡ�����������ִ���
% OutputName = strcat(int2str(Recognized_index),'.bmp');