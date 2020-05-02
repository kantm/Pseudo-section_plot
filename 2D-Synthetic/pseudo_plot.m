close all
clear all
clc

% pseudo section plot for dipole-dipole 2D survey

res = dlmread('resistivity.txt');
electrode_loc = dlmread('electrode_loc.txt');
C1 = electrode_loc(:,1);
C2 = electrode_loc(:,2);
P1 = electrode_loc(:,3);
P2 = electrode_loc(:,4);

% For the dipole-dipole electrode configuration, the data are plotted beneath the midpoint
% between the dipoles at a depth of half the distance between the dipole centers.

L = (abs(((P1+P2)/2)-((C1+C2)/2)))/2;
dipole_mid_point = (abs(((P1+P2)/2)+((C1+C2)/2)))/2;

X = dipole_mid_point;
Y = L;

scatter(X,Y,100,res,'filled');
set(gca,'YDir','reverse');
xlabel('dipole mid point locations');
ylabel('pseudo depth');
xlim([min(X)-std(X),max(X)+std(X)]);
ylim([min(Y)-std(Y),max(Y)+std(Y)]);
colorbar;

% [xq,yq] = meshgrid(min(X):std(X):max(X), min(Y):std(Y):max(Y));
% vq = griddata(X,Y,res,xq,yq);
% contour(xq,yq,vq);


