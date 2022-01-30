function [L] = Cholesky(A)
    [n,m]=size(A);
    L = zeros(n,m);
    for k = 1:n
        L(k,k) = A(k,k);
        for r = 1:k-1
            L(k,k) = L(k,k) - L(k,r)^2;
        end

        L(k,k) = sqrt(L(k,k));

        for i=k+1:n
            L(i,k)=A(i,k);
                for r=1:k-1
                    L(i,k) = L(i,k) - (L(i,r)*L(k,r));
                end
            L(i,k) = L(i,k)/L(k,k);
        end
    end
end