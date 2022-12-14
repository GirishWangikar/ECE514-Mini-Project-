clc
clear all
close all
uniform_variable=0;
normal_variable=0;
exponential_variable=0;
count = 0;
i = 100;
transform_mean = zeros(1,9);
transform_variance = zeros(1,9);

while(i <= 10000)
    
% Uniform Distribution
N = i;
uniform_transform = 2 + (4-2)*rand(N,N);
X_uni = sum(uniform_transform)/N;
count = count+1;
transform_mean(count) = mean(X_uni);
transform_variance(count) = var(X_uni);
figure(1)
uniform_variable = uniform_variable+1;
plot(uniform_variable) = subplot(3,1,uniform_variable);
histogram(X_uni,'BinMethod','sqrt')
grid on;
xlabel('Random Variable Y');
if uniform_variable == 2
ylabel('PDF of y : f(y)');
end
title(plot(uniform_variable),['Transform Y of Uniform Distribution for N = ' num2str(N)])

%% Normal Distribution
normal_transform = normrnd(2,sqrt(2),[N,N]);
X_norm = sum(normal_transform)/N;
figure(2)
normal_variable = normal_variable+1;
plot(normal_variable) = subplot(3,1,normal_variable);
histogram(X_norm,'BinMethod','sqrt')
count = count+1;
transform_mean(count) = mean(X_norm);
transform_variance(count) = var(X_norm);
grid on;
xlabel('Random Variable Y');
if normal_variable == 2
ylabel('Probability Density Function (f(y))');
end
title(plot(normal_variable),['Transform Y of Normal Distribution for N = ' num2str(N)])

%% Exponenetial Distribution
exponential_transform = exprnd(0.5,N,N);
X_exp = sum(exponential_transform)/N;
figure(3)
exponential_variable = exponential_variable+1;
plot(exponential_variable) = subplot(3,1,exponential_variable);
histogram(X_exp,'BinMethod','sqrt')
count = count+1;
transform_mean(count) = mean(X_exp);
transform_variance(count) = var(X_exp);
grid on;
xlabel('Random Variable Y');
if exponential_variable == 2
ylabel('Probability Density Function (f(y))');
end
title(plot(exponential_variable),['Transform Y of Exponential Distribution for N = ' num2str(N)])

i = i*10;
end