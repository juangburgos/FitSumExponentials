clear all;
clc;

%% Create test data

% independent variable x
dx = 0.02;
x  = (dx:dx:1.5)';
nx = length(x);
% independent variable y
dy = 0.05;
y  = (dy:dy:1.5)';
ny = length(y);
% dependent variable z(x, y)
% stored in column vector head-to-tail for each y[k]
z = zeros(nx*ny, 1);
for k = 1:1:ny
    z_start = nx*(k-1)+1;
    z_end   = nx*k;
    % calculate z(y[k])
    z(z_start:z_end) = 5*exp(0.5*x)*y(k) + 4*exp(-3*x);
end

%% Estimate exponential contants ("lambdas")

% build least squares matrix Z to obtain lambdas
Z = zeros(nx*ny, 2+2*ny);
for k = 1:1:ny
    z_start = nx*(k-1)+1;
    z_end   = nx*k;    
    % calculate integrals of z(y[k]) wrt x, for each kth sample in y
    iz1 = cumtrapz(x, z(z_start:z_end));
    iz2 = cumtrapz(x, iz1);
    % store in appropriate location
    Z(z_start:z_end, 1:2) = [iz1, iz2];
    Z(z_start:z_end, 2+2*(k-1)+1:2+2*(k-1)+2) = [x, ones(size(x))];
end
% get exponentials lambdas
A = pinv(Z)*z;
lambdas = eig([A(1), A(2); 1, 0]);
lambdas
%lambdas =
%  -2.9991
%   0.5000

%z_hat = Z*A;
%figure();
%plot(z, 'b-'); hold on;
%plot(z_hat, 'r--'); hold on;

%% Estimate exponentials multipliers

% build least squares matrix X to obtain multipliers
X = zeros(nx*ny, 2);
for k = 1:1:ny
    x_start = nx*(k-1)+1;
    x_end   = nx*k;    
    X(x_start:x_end, :) = [exp(lambdas(2)*x)*y(k), exp(lambdas(1)*x)];
end
P = pinv(X)*z;
P
%P =
% 4.9999
% 3.9995