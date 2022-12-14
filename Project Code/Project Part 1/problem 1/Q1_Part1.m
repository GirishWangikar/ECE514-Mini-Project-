%% ECE514 Project Part 1 Question 1 
%% Name : Girish Wangikar 
clc
clear all
close all
i = 100;
Fig_num = 0;
count = 0;
mean_mat_route  = zeros(1,9);
variance_mat_route  = zeros(1,9);
mean_reject   = zeros(1,9);
variance_reject   = zeros(1,9);

while(i <= 10000)
N = i;
%% Returns an array of random scalars drawn from the standard normal distribution
norm_distrib = normrnd(2,sqrt(2),[1,N]);
Fig_num = Fig_num+1;
figure(Fig_num)
plot(1)=subplot(1,2,1);
histogram(norm_distrib)
xlabel(plot(1),'Random Variable X');
ylabel(plot(1),'PDF of RV X : f(x)');
title(plot(1),{'Normal Distribution using Matlab routine for N =' num2str(N)})
X = normal_rejection(N);
plot(2)=subplot(1,2,2);
histogram(X)
grid on;
xlabel(plot(2),'Random Variable X');
ylabel(plot(2),'PDF of RV X : f(x)');
title(plot(2),{'Normal Distribution using Rejection Method for N =' num2str(N)})


count = count+1;
mean_mat_route(count) = mean(norm_distrib);
mean_reject(count) = mean(X);
variance_mat_route(count) = var(norm_distrib);
variance_reject(count) = var(X);

% Returns an array of uniformly distributed random numbers in the interval (0,1).
uniform_distribution = 2 + (4-2)*rand(1,N);
Fig_num = Fig_num+1;
figure(Fig_num)
plot(1)=subplot(1,2,1);
histogram(uniform_distribution)
xlabel(plot(1),'Random Variable X ');
ylabel(plot(1),'PDF of RV X : f(x)');
title(plot(1),{'Uniform Distribution using Matlab routine for N = ' num2str(N)})
plot(2)=subplot(1,2,2);
X = uniform_rejection(N);
X = X.';
histogram(X)
grid on;
xlabel(plot(2),'Random Variable X');
ylabel(plot(2),'PDF of RV X : f(x)');
title(plot(2),{'Uniform Distribution using Rejection Method for N =' num2str(N)})

count = count+1;
mean_mat_route(count) = mean(uniform_distribution);
mean_reject(count) = mean(X);
variance_mat_route(count) = var(uniform_distribution);
variance_reject(count) = var(X);


%% Generates random numbers from the exponential distribution with mean parameter = 2.
exponential_distrib = exprnd(0.5,1,N);
Fig_num = Fig_num+1;
figure(Fig_num)
plot(1)=subplot(1,2,1);
histogram(exponential_distrib,'BinMethod','fd')
xlabel(plot(1),'Random Variable X');
ylabel(plot(1),'PDF of RV X : f(x)');
title(plot(1),{'Exponential Distribution using matlab routine for N =' num2str(N)})
X = Exponential_rejection(N);
plot(2)=subplot(1,2,2);
histogram(X,'BinMethod','fd')
grid on;
xlabel(plot(2),'Random Variable X');
ylabel(plot(2),'PDF of RV X : (f(x))');
title(plot(2),{'Exponential Distribution using Rejection Method for N =' num2str(N)})


count = count+1;
mean_mat_route(count) = mean(exponential_distrib);
mean_reject(count) = mean(X);
variance_mat_route(count) = var(exponential_distrib);
variance_reject(count) = var(X);

i = i*10;
end