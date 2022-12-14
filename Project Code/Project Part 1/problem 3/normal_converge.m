function [transform_rand, A,B, error, D] = normal_converge()

clc
clear all
close all
% Normal Distribution
M = 500;
N = 2000;
transform_rand = zeros(M,N);
e = 0.05;

% Generation of M Realizations
for i = 1: M
norm_transform = normrnd(2,sqrt(2),[N,N]);
transform_rand(i,1:1:N) = transform_function(norm_transform);
end

% Convergence in Probability 
A = zeros(1,length(transform_rand));
for n = 1:1: length(transform_rand)
c = 0;
    for m = 1 : 1 : M
        if (transform_rand(m,n)-2 > e) 
        c = c + 1;
        elseif (transform_rand(m,n)-2 < (-1*e))
        c = c + 1;
        end
    end 
A(1,n)= c/M;
end

% Almost Sure Convergence 
K = 0.5;
B = zeros(1,(K*N));
for n2 = 1:1: (K*N)
c = 0;   
    for m = 1 : 1 : M
        for n1 = n2 : 1 : N
            if (transform_rand(m,n1)-2 > e) 
            c = c + 1;
            break;
            elseif (transform_rand(m,n1)-2 < (-1*e))
            c = c + 1;
            break;
            end
        end
    end  
B(1,n2)= c/M;
end

% Mean Square Convergence 

e = (transform_rand-2).^2;
error = sum(e)/M;


% Convergence in Distribution
d = -1 :0.00001:1;
D = zeros(1,length(d));
n = N;
for t = 1 : 1 : length(d)
c1 = 0;
    for m1 = 1 : 1 : M
        if (transform_rand(m1,n)-2) <= d(t)
        c1 = c1 + 1;
        end
    end
D(1,t) = c1/M;
end
end