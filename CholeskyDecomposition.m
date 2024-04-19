% Cholesky Decomposition: 

clear;
clc;

syms x1 x2 x3
eq = [
    25*x1 + 15*x2 - 5*x3 == 35,
    15*x1 + 18*x2 + 0*x3  == 33,
    -5*x1 + 0*x2  + 11*x3 == 6,
    ];

[A, b] = equationsToMatrix(eq)
y = zeros(1, size(A, 2));
x = zeros(1, size(A, 2));

if ishermitian(logical(A))
    if all(real(eval(eig(A))) > 0)

        Ly_b = [chol(A, "lower") b]

        for i=1:size(Ly_b, 1)
            s = sum(Ly_b(i, 1:i-1).*y(1:i-1));
            y(i) = (Ly_b(i, end) - s)./Ly_b(i,i);
        end

         LTx_y = [chol(A, "upper") transpose(y)]

        for i=size(LTx_y, 1):-1:1
            s = sum(LTx_y(i, i+1:end-1).*x(i+1:end));
            x(i) = (LTx_y(i, end) - s)./LTx_y(i, i);
        end
    end
end
x
