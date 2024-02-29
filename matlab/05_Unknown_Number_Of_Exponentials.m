clear all;
clc;
% get data
dx = 0.02;
x  = (dx:dx:1.5)';
y  = 5*exp(0.5*x) + 4*exp(-3*x) + 2*exp(-2*x);

% calculate n integrals of y and n-1 powers of x
n = 10;
iy = zeros(length(x), n);
xp = zeros(length(x), n-1);
iy(:,1) = cumtrapz(x, y);
xp(:,1) = ones(size(x));
for ii=2:1:n
    iy(:, ii) = cumtrapz(x, iy(:, ii-1));
    xp(:, ii) = xp(:, ii-1) .* x;
end

% calculate singular values of Y
Y = [iy, xp];
ysv = svd(Y);

% scale singular values to percentage
ysv_scaled = 100 * ysv ./ sum(ysv)
bar(ysv_scaled);
%ysv_scaled =
%   6.9606e+01
%   2.3696e+01
%   4.2812e+00
%   1.5760e+00
%   6.8682e-01
%   1.3106e-01
%   2.0743e-02
%   2.5832e-03
%   2.5537e-04
%   ... even smaller ones

% select n principal components above a threshold of 0.1% 
thres = 0.1;
n = sum(ysv_scaled > thres ) / 2
% n = 3 (6 singular values) covers about 99.97% of all components contributions
covers = sum(ysv_scaled(1:2*n))
% covers = 99.976