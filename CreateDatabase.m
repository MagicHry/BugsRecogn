function T = CreateDatabase(TrainDatabasePath) 
%�������ܣ��Ѷ�άͼ���Ϊһά���������ڹ���T
%TrainDatabasePath��ѵ����·��
%����ֵT��һ����ά��������P��M*N��ͼ����TΪM*N��P�еľ���
%%%%%%%��ȡѵ����·������ͳ����������

TrainFiles = dir(TrainDatabasePath);%ѵ����·������2άͼ��ת��Ϊһά����
fprintf('���ݴ�·��->%s ,�����������ݿ� \n', TrainDatabasePath);

% T = [];%��ʼ��
% ImageFiles = dir(TrainDatabasePath);
% ImageFilePaths = [];
% for index = 1: length(ImageFiles)
%     curImageFileName = ImageFiles(index).name;
%     %ƥ���ļ�ʱ�ų�.�Լ�..
%     if(isequal(curImageFileName, '.') || isequal(curImageFileName, '..'))
%         continue
%     end
%     if(endsWith(curImageFileName, 'bmp'))
%         %����������Ҫ�����ͼƬ
% 
%         %STEP1.�ַ���ƴ�ӣ��õ�ÿһ��ѵ��ͼƬ������·����
%         curImagePath = strcat(TrainDatabasePath, '\', curImageFileName);
%         fprintf('��ȡѵ�����ļ�->%s \n', curImagePath);
%         ImageFilePaths = [ImageFilePaths, ];
% 
%         %STEP2.����ѵ��ͼƬ
%         img = imread(curImagePath);
% 
%         %STEP3.�Ҷȴ���
%         img = rgb2gray(img);
% 
%         %STEP4.�õ�ͼƬ��С,���Ҷ�άͼƬתΪһά����
%         [irow icol] = size(img);
%         temp = reshape(img',irow*icol,1);
% 
%         %STEP5.���|ÿ��ͼƬ����Ϣ��ΪT��һ��   
%         T = [T temp];
% 
%         sort(ImageFilePaths);
%     end
% end





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