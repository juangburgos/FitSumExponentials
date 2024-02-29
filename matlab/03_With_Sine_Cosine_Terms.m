clear all;
clc;
% get data
dx = 0.02;
x  = (dx:dx:1.5)';
y  =  5*exp(0.5*x) + 4*cos(0.15*x);

% calculate integrals
iy1 = cumtrapz(x, y);
iy2 = cumtrapz(x, iy1);
iy3 = cumtrapz(x, iy2);

% get exponentials lambdas
Y = [iy1, iy2, iy3, x.^2, x, ones(size(x))];
A = pinv(Y)*y;

lambdas = eig([A(1), A(2), A(3); 1, 0, 0; 0, 1, 0]);
lambdas
%lambdas =
%   0.5000 +      0i
%  -0.0000 + 0.1500i
%  -0.0000 - 0.1500i

% get exponentials multipliers
X = [exp(lambdas(1)*x), exp(lambdas(2)*x), exp(lambdas(3)*x)];
P = pinv(X)*y;
P
%P =
%   5.0001 + 0.0000i
%   2.0000 + 0.0001i
%   2.0000 - 0.0001i