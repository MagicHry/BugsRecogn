function T = CreateDatabase(TrainDatabasePath) 
%�������ܣ��Ѷ�άͼ���Ϊһά���������ڹ���T
%TrainDatabasePath��ѵ����·��
%����ֵT��һ����ά��������P��M*N��ͼ����TΪM*N��P�еľ���
%%%%%%%��ȡѵ����·������ͳ����������

TrainFiles = dir(TrainDatabasePath);%ѵ����·������2άͼ��ת��Ϊһά����

T = [];%��ʼ��
for i = 1 : 20%��������ͼƬ
%��ȡͼ������ִ���
%��ȡѵ����ÿһ��ͼ�񣬵õ���ߴ磬��ʼ��ͼ�ξ���

    str = int2str(i);%����������ת��Ϊ�ַ���   
    str = strcat('\',str,'.bmp');%�ַ���ƴ��,�õ�\i.bmp
    str = strcat(TrainDatabasePath,str);%�ַ���ƴ�ӣ��õ�ÿһ��ѵ��ͼƬ������·����
    
    img = imread(str);%����ѵ��ͼƬ
    img = rgb2gray(img); %תΪ�Ҷ�
    
    [irow icol] = size(img);%�õ�ͼƬ��С
   
    temp = reshape(img',irow*icol,1);  %����άͼƬתΪһά����
    T = [T temp];     % ÿ��ͼƬ����Ϣ��ΪT��һ��   
end