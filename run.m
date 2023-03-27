clear all
clc
close all

%�Զ�������ó�ʼĿ¼·��
% TrainDatabasePath = uigetdir(strcat(matlabroot,'\work'), 'ѡ��ѵ��������' );
% fprintf('ѵ����·��->%s\n', TrainDatabasePath)
% TestDatabasePath = uigetdir(strcat(matlabroot,'\work'), 'ѡ�����������');
% fprintf('���Լ�·��->%s\n', TrainDatabasePath)
TrainDatabasePath = 'H:\bugs-recogn\BugsRecogn\TrainDatabase';
TestDatabasePath = 'H:\bugs-recogn\BugsRecogn\TestDatabase';

%��ȡ������·��
prompt = {'�������ͼƬ���ִ���1-20'};
dlg_title = '����ʶ��ϵͳ';
num_lines= 1;
def = {'1'};

%���û�ѡ��[���Լ���]��Ҫ����ƥ���ͼƬ
TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.bmp');
im = imread(TestImage);
%���ص�����A����ͼ�����ݡ�
%���ļ�������ɫͼ��A��M*N�����飻���ļ��������ɫͼ��A��M*N*3�����顣

%�����������ݿ�
T = CreateDatabase(TrainDatabasePath);%����ѵ��ͼƬ·������2ά����
[m, A, Eigenfaces,D] = EigenfaceCore(T);%����������

%��ʼʶ��������ƥ��
MatchedImags = Recognition(TestImage, m, A, Eigenfaces);

%Ĭ��ƥ������ͼƬ
FirstMatchImg = strcat(TrainDatabasePath,'\',MatchedImags(1));
FirstMatchImg = imread(FirstMatchImg);
FirstMatchImgName = MatchedImags(1);

%�Ƿ������ƥ��
OutputSize = length(MatchedImags);
haveBestMatch = OutputSize == 1;

%�����Ƿ������ƥ�䣬�ı����ģʽ
showingCols = 3;
if haveBestMatch
    showingCols = 2;
end

% ��ʾͼƬ
figure;
subplot(1,showingCols,1);imshow(im);
title('����ͼƬ');
subplot(1,showingCols,2);imshow(FirstMatchImg);
title('�������ƥ��');

%���û�����ƥ�䣬˵��ƥ��Ȳ����ߣ�����μ�ƥ��
if (~haveBestMatch)
    SecMatchImg = strcat(TrainDatabasePath,'\',MatchedImags(2));
    SecMatchImg = imread(SecMatchImg);
    subplot(1,showingCols,3);imshow(SecMatchImg);
    title('���ڴμ�ƥ��');
end

%���ʶ����������ִ���
str = strcat('ƥ��ͼƬ�� :  ',FirstMatchImgName);
disp(str)

%������
if strcmp(FirstMatchImgName,'1.bmp') | strcmp(FirstMatchImgName,'2.bmp') |  strcmp(FirstMatchImgName,'3.bmp') |  strcmp(FirstMatchImgName,'4.bmp')
    msgbox('ʶ�����Ǻ�����');
elseif strcmp(FirstMatchImgName,'5.bmp') | strcmp(FirstMatchImgName,'6.bmp') |  strcmp(FirstMatchImgName,'7.bmp') |  strcmp(FirstMatchImgName,'8.bmp')
    msgbox('ʶ��������룡');
elseif strcmp(FirstMatchImgName,'9.bmp') | strcmp(FirstMatchImgName,'10.bmp') |  strcmp(FirstMatchImgName,'11.bmp') |  strcmp(FirstMatchImgName,'12.bmp')
    msgbox('ʶ����������ư�棡');
elseif strcmp(FirstMatchImgName,'13.bmp') | strcmp(FirstMatchImgName,'14.bmp') |  strcmp(FirstMatchImgName,'15.bmp') |  strcmp(FirstMatchImgName,'16.bmp')
    msgbox('ʶ�������۷䣡');
elseif strcmp(FirstMatchImgName,'17.bmp') | strcmp(FirstMatchImgName,'18.bmp') |  strcmp(FirstMatchImgName,'19.bmp') |  strcmp(FirstMatchImgName,'20.bmp')
    msgbox('ʶ���������ϣ�');
end


% 
% % �����������ݿ�
% T = CreateDatabase(TrainDatabasePath);%����ѵ��ͼƬ·������2ά����
% [m, A, Eigenfaces,D] = EigenfaceCore(T);%����������
% FirstMatchImg = Recognition(TestImage, m, A, Eigenfaces);
% 
% % ѡ����Ҫʶ���ͼƬ
% SelectedImage = strcat(TrainDatabasePath,'\',FirstMatchImg);
% SelectedImage = imread(SelectedImage);
% 
% % ��ʾͼƬ
% figure;
% subplot(1,2,1);imshow(im);
% title('����ͼƬ');
% subplot(1,2,2);imshow(SelectedImage);
% title('����ƥ������');
% %���ʶ����������ִ���
% str = strcat('ƥ��ͼƬ�� :  ',FirstMatchImg);
% disp(str)
% 
% %������
% if strcmp(FirstMatchImg,'1.bmp') | strcmp(FirstMatchImg,'2.bmp') |  strcmp(FirstMatchImg,'3.bmp') |  strcmp(FirstMatchImg,'4.bmp')
%     msgbox('ʶ�����Ǻ�����');
% elseif strcmp(FirstMatchImg,'5.bmp') | strcmp(FirstMatchImg,'6.bmp') |  strcmp(FirstMatchImg,'7.bmp') |  strcmp(FirstMatchImg,'8.bmp')
%     msgbox('ʶ��������룡');
% elseif strcmp(FirstMatchImg,'9.bmp') | strcmp(FirstMatchImg,'10.bmp') |  strcmp(FirstMatchImg,'11.bmp') |  strcmp(FirstMatchImg,'12.bmp')
%     msgbox('ʶ����������ư�棡');
% elseif strcmp(FirstMatchImg,'13.bmp') | strcmp(FirstMatchImg,'14.bmp') |  strcmp(FirstMatchImg,'15.bmp') |  strcmp(FirstMatchImg,'16.bmp')
%     msgbox('ʶ�������۷䣡');
% elseif strcmp(FirstMatchImg,'17.bmp') | strcmp(FirstMatchImg,'18.bmp') |  strcmp(FirstMatchImg,'19.bmp') |  strcmp(FirstMatchImg,'20.bmp')
%     msgbox('ʶ���������ϣ�');
% end

