clear all
clc
close all

%�Զ�������ó�ʼĿ¼·��
TrainDatabasePath = uigetdir(strcat(matlabroot,'\work'), 'ѡ��ѵ��������' );
TestDatabasePath = uigetdir(strcat(matlabroot,'\work'), 'ѡ�����������');

%��ȡ������·��
prompt = {'�������ͼƬ���ִ���1-20'};
dlg_title = '����ʶ��ϵͳ';
num_lines= 1;
def = {'1'};

TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.bmp');
im = imread(TestImage);
%���ص�����A����ͼ�����ݡ�
%���ļ�������ɫͼ��A��M*N�����飻���ļ��������ɫͼ��A��M*N*3�����顣

% �����������ݿ�
T = CreateDatabase(TrainDatabasePath);%����ѵ��ͼƬ·������2ά����
[m, A, Eigenfaces,D] = EigenfaceCore(T);%����������
OutputName = Recognition(TestImage, m, A, Eigenfaces);

% ѡ����Ҫʶ���ͼƬ
SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

% ��ʾͼƬ
figure;
subplot(1,2,1);imshow(im);
title('����ͼƬ');
subplot(1,2,2);imshow(SelectedImage);
title('����ƥ������');
%���ʶ����������ִ���
str = strcat('ƥ��ͼƬ�� :  ',OutputName);
disp(str)

%������
if strcmp(OutputName,'1.bmp') | strcmp(OutputName,'2.bmp') |  strcmp(OutputName,'3.bmp') |  strcmp(OutputName,'4.bmp')
    msgbox('ʶ�����Ǻ�����');
elseif strcmp(OutputName,'5.bmp') | strcmp(OutputName,'6.bmp') |  strcmp(OutputName,'7.bmp') |  strcmp(OutputName,'8.bmp')
    msgbox('ʶ��������룡');
elseif strcmp(OutputName,'9.bmp') | strcmp(OutputName,'10.bmp') |  strcmp(OutputName,'11.bmp') |  strcmp(OutputName,'12.bmp')
    msgbox('ʶ����������ư�棡');
elseif strcmp(OutputName,'13.bmp') | strcmp(OutputName,'14.bmp') |  strcmp(OutputName,'15.bmp') |  strcmp(OutputName,'16.bmp')
    msgbox('ʶ�������۷䣡');
elseif strcmp(OutputName,'17.bmp') | strcmp(OutputName,'18.bmp') |  strcmp(OutputName,'19.bmp') |  strcmp(OutputName,'20.bmp')
    msgbox('ʶ���������ϣ�');
end
