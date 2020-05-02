close all
clear all
clc

% pseudo section plot for dipole-dipole 3D survey

% For the dipole-dipole electrode configuration, the data are plotted beneath the midpoint
% between the dipoles at a depth of half the distance between the dipole centers.

src_loc = dlmread('SrcFile.txt');
rec_loc = dlmread('RecFile.txt');
res = dlmread('resistivity.txt');

% SrcFile.txt contains current electrode locations C1(x),C1(y),C2(x),C2(y)
% RecFile.txt contains potential electrode locations P1(x),P1(y),P2(x),P2(y)

C1 = src_loc(:,1:2);
C2 = src_loc(:,3:4);
P1 = rec_loc(:,1:2);
P2 = rec_loc(:,3:4);

dipole_mid_point = (((P1+P2)/2)+((C1+C2)/2))/2;
L = abs(((P1+P2)/2)-((C1+C2)/2))/2;   % half the distance between the dipole centers.
Lx = L(:,1).^2; Ly = L(:,2).^2;
L = (Lx + Ly).^0.5;


X = dipole_mid_point(:,1);
Y = dipole_mid_point(:,2);
Z = L(:,1);

% scatter3(X,Y,Z,100,res,'filled');
% set(gca,'ZDir','reverse');
% xlabel('dipole mid point x-locations');
% ylabel('dipole mid point y-locations');
% zlabel('pseudo depth');
% xlim([min(X)-std(X),max(X)+std(X)]);
% ylim([min(Y)-std(Y),max(Y)+std(Y)]);
% zlim([min(Z)-std(Z),max(Z)+std(Z)]);
% colorbar;

[xq,yq] = meshgrid(min(X):std(X):max(X), min(Y):std(Y):max(Y));
vq = griddata(X,Y,res,xq,yq);
% contour3(xq,yq,vq);
mesh(xq,yq,vq);
set(gca,'ZDir','reverse');
xlabel('dipole mid point x-locations');
ylabel('dipole mid point y-locations');
zlabel('pseudo depth');
xlim([min(X)-std(X),max(X)+std(X)]);
ylim([min(Y)-std(Y),max(Y)+std(Y)]);
zlim([min(Z)-std(Z),max(Z)+std(Z)]);
colorbar;