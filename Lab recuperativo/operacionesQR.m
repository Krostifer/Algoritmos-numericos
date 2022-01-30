function [Q, R, operaciones] = operacionesQR (A)
    operaciones = 1;
    [m, n] = size(A);
    operaciones = operaciones + 6 + m + n;
    R = zeros(n, n);
    operaciones = operaciones + 6 + (m*n) + 1;
    V = A;
    operaciones = operaciones + 1;
    Q=zeros(m, n);
    operaciones = operaciones + 6 + 1 + m*n;

    for i =1:n
        R(i,i)= norm(V(:,i));
        operaciones = operaciones + 6 + size(V, 1);
        Q(:,i)= V(:,i)/R(i,i);
        operaciones = operaciones + 6 + size(V, 1);
        for j=i+1:n
           R(i,j)= (Q(:,i)')*V(:,j);
           operaciones = operaciones + 6 + size(Q, 1);
           V(:,j)=V(:,j) - R(i,j)*Q(:,i);
           operaciones = operaciones + 6 + size(Q,1) + size(V, 1);
        end
    end
end