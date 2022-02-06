# Fit Sum of Exponentials

Repo to license code for fitting a sum of exponentials as described in:

https://math.stackexchange.com/questions/1428566/fit-sum-of-exponentials/3808325#3808325

It applies for `n` exponentials and variations as described in the link above. 

For example, a 4 exponential fit:

```matlab
clear all;
clc;
% get data
dx = 0.02;
x  = (dx:dx:1.5)';
y  =  5*exp(0.5*x) + 4*exp(-3*x) + 2*exp(-2*x) - 3*exp(0.15*x);

% calculate integrals
iy1 = cumtrapz(x, y);
iy2 = cumtrapz(x, iy1);
iy3 = cumtrapz(x, iy2);
iy4 = cumtrapz(x, iy3);

% get exponentials lambdas
Y = [iy1, iy2, iy3, iy4, x.^3, x.^2, x, ones(size(x))];
A = pinv(Y)*y;

lambdas = eig([A(1), A(2), A(3), A(4); 1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0]);
lambdas
%lambdas =
%  -2.9991
%  -1.9997
%   0.5000
%   0.1500

% get exponentials multipliers
X = [exp(lambdas(1)*x), exp(lambdas(2)*x), exp(lambdas(3)*x), exp(lambdas(4)*x)];
P = pinv(X)*y;
P
%P =
%   4.0042
%   1.9955
%   4.9998
%  -2.9996
```

---

# License

MIT license.

Copyright (c) 2020 - forever Juan Gonzalez Burgos

---

# Citing

To cite this algorithm please use:

```bibtex
@MISC {3808325,
    TITLE = {Fit sum of exponentials},
    AUTHOR = {Juan Gonzalez Burgos (https://math.stackexchange.com/users/605948/juan-gonzalez-burgos)},
    HOWPUBLISHED = {Mathematics Stack Exchange},
    NOTE = {URL:https://math.stackexchange.com/q/3808325 (version: 2020-08-31)},
    EPRINT = {https://math.stackexchange.com/q/3808325},
    URL = {https://math.stackexchange.com/q/3808325}
}
```

or

```amsrefs
\bib\{3808325}{misc}{    
    title={Fit sum of exponentials},    
    author={Juan Gonzalez Burgos (https://math.stackexchange.com/users/605948/juan-gonzalez-burgos)},    
    note={URL: https://math.stackexchange.com/q/3808325 (version: 2020-08-31)},    
    eprint={https://math.stackexchange.com/q/3808325},    
    organization={Mathematics Stack Exchange}  
}
```
