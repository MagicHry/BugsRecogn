function [m, A, Eigenfaces,D] = EigenfaceCore(T)
% 用PCA原理决定人脸图像的最优特征，得到一个二维矩阵，包含训练图像向量，返回四个输出
% 参数:T包含训练集中所有的图像信息集合，
% 返回值：
%   m：(M*Nx1)训练均值;
%   Eigenfaces：(M*Nx(P-1))训练集协方差矩阵的特征向量；
%   A：(M*NxP) 每一张图像与均值图像的方差矩阵

m = mean(T,2); % 平均图像/行平均（每一副图像的对应象素求平均）mean(A , dim)dim=1 时， 即 ：mean(A,1) = mean (A)
%dim=2 时，对行求平均数
A = [];  
for i = 1 : 20
    temp = double(T(:,i)) - m; %计算每个样本的减去平均样本
    A = [A temp]; % 合成一个N*N矩阵
end

%%%%%%%%%%%%%%%%%%%%%%%% 求解特征值和特征向量


L = A'*A; %.计算协方差矩阵
[V D] = eig(L); %.求特征向量和特征

% 选取特征向量
L_eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec V(:,i)];
    end
end

% 降维
Eigenfaces = A * L_eig_vec; % 特征脸获取

