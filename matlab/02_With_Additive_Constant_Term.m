clear all;
clc;
% get data
dx = 0.02;
x  = (dx:dx:1.5)';
y  =  -1 + 5*exp(0.5*x) + 4*exp(-3*x) + 2*exp(-2*x);

% calculate integrals
iy1 = cumtrapz(x, y);
iy2 = cumtrapz(x, iy1);
iy3 = cumtrapz(x, iy2);

% get exponentials lambdas
Y = [iy1, iy2, iy3, x.^3, x.^2, x, ones(size(x))];
A = pinv(Y)*y;

lambdas = eig([A(1), A(2), A(3); 1, 0, 0; 0, 1, 0]);
lambdas
%lambdas =
%  -2.9991
%  -1.9997
%   0.5000

% get exponentials multipliers
X = [ones(size(x)), exp(lambdas(1)*x), exp(lambdas(2)*x), exp(lambdas(3)*x)];
P = pinv(X)*y;
P
%P =
%  -0.9996
%   4.0043
%   1.9955
%   4.9999