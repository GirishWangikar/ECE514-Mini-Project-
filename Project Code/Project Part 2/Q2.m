
clc;
clear;
close all;
syms x y;
f=@(x,y)x+(3/2)*y.^2;%given joint pdf of x and y
fx=int(f,y,[0,1]);
fy=int(f,x,[0,1]);% marginal pdf calculation
Ex=int(x*fx,x,[0,1]);
Ey=int(y*fy,y,[0,1]);
Ex2=int(x^2*fx,x,[0,1]);
Ey2=int(y^2*fy,y,[0,1]); %second order moment calculation

%Variance of X
variance_x=Ex2-(Ex^2);
variance_x=(variance_x);
%Variance of Y
variance_y=Ey2-(Ey^2);
variance_y=(variance_y);


f1=@(x,y) x.^2.*y+(3/2)*y.^3.*x;
Exy=integral2(f1,0,1,0,1);
%co efficient of Cov(x,y)
covxy=(Exy-(Ex*Ey));
Covxymat=([variance_x covxy; covxy variance_y]);
Covxymat1=round(Covxymat,3);
d = sqrt(diag(Covxymat));
correlation_matrix=[Ex2 (Exy);(Exy) Ey2];
correlation_matrix1=round(correlation_matrix,3)
Covxymat1
%generate 1000 sample Xs
L= chol(Covxymat,'nocheck'); 
n=500;
R=randn(2,n);
X=L'*R;
Xs=cov(X')
disp(Xs);
Covar_Xs=round(Xs,3);
Covar_Xs
difference=Covxymat1-Covar_Xs