function [L, U, operaciones] = operacionesLU(A)
    n = size(A, 1);
    operaciones = 6 + n;
    for k = 1:n
        L(k,k) = 1;
        operaciones = operaciones + 1;
        for i = k+1:n
            L(i,k) = A(i,k) / A(k,k);
            operaciones = operaciones + 2;
            for j = k+1:n
                A(i,j) = A(i,j) - L(i,k)*A(k,j);
                operaciones = operaciones + 3;
            end
        end
        for j = k:n
            U(k,j) = A(k,j);
            operaciones = operaciones + 1;
        end
    end
end