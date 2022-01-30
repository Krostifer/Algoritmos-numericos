function [L, operaciones] = operacionesCholesky(A)
    [n,m]=size(A);
    operaciones = 6 + m + n;
    L = zeros(n,m);
    operaciones = operaciones + 6 + n*m;
    for k = 1:n
        L(k,k) = A(k,k);
        operaciones = operaciones + 1;
        for r = 1:k-1
            L(k,k) = L(k,k) - L(k,r)^2;
            operaciones = operaciones + 3;
        end

        L(k,k) = sqrt(L(k,k));
        operaciones = operaciones + 6 + 1;

        for i=k+1:n
            L(i,k)=A(i,k);
            operaciones = operaciones + 1;
                for r=1:k-1
                    L(i,k) = L(i,k) - (L(i,r)*L(k,r));
                    operaciones = operaciones + 3;
                end
            L(i,k) = L(i,k)/L(k,k);
            operaciones = operaciones + 2;
        end
    end
end