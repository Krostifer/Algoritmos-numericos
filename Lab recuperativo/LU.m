function [L, U] = LU(A)

    n = size(A, 1);

    for k = 1:n
        L(k,k) = 1;
        for i = k+1:n
            L(i,k) = A(i,k) / A(k,k);
            for j = k+1:n
                A(i,j) = A(i,j) - L(i,k)*A(k,j);
            end
        end
        for j = k:n
            U(k,j) = A(k,j);
        end
    end
end