% Gaussian Elimination:

clear;
clc;

% Addressing variables to use in equations.
syms x1 x2 x3

% Equations.
eq = [
    25*x1 + 15*x2 - 5*x3 == 35,
    15*x1 + 18*x2 + 0*x3  == 33,
    -5*x1 + 0*x2  + 11*x3 == 6,
    ];

% separating Coefficient and results in in matrices.
[Coefficients,results] = equationsToMatrix(eq)

% Creating 1 dimensional matrix to show final results.
x = zeros(1, size(Coefficients, 2));

% Concating both matrices Coefficients and results.
A = [Coefficients results]

% Forward Elimination:

% number of iterations  based on number of rows in A starting from (1).
for i=1:size(A, 1)

    % number of iterations  based on number of rows in A starting from 
    % (i+1).
    for j=i+1:size(A, 1)

        % The key is the factor the main row mull be multiplied by to get
        % zero when subtracting.
        key = A(j,i)./A(i,i);

        % Assigning the new row after subtraction. 
        A(j, :) = A(j, :) - key.*A(i, :);
    end
end
A

% Backward Substitution:

% number of iterations  based on number of rows in A starting from 
% (number of rows in A till 1).
for i=size(A, 1):-1:1

    % finding sum of found variables.
    s = sum(A(i, i+1:end-1).*x(i+1:end));

    % Assigning (x)s to matrix x afetr division.
    x(i) = (A(i, end) - s)./A(i, i);
end
x
