% Metodo de Gram-Schmidt modificado para hacer la factorizacion QR reducida de una matriz A
function [Q, R, timeGS] = GramSchmidt(A)
    %Se toma el tiempo al inicio de la ejecucion
    tic();
    [m, n] = size(A);
        %Se comprueban las dimesiones de las matrices
        if m < n
            error('Las dimensiones de la matriz A son incorrectas');
        end
        Q = A;
        R = zeros(n);
        for k=1:n
            for i=1:k-1
                R(i,k) = Q(:,i)'*Q(:,k);
                Q(:,k) = Q(:,k) - Q(:,i)*R(i,k);
            end
            R(k,k) = norm(Q(:,k));
            Q(:,k) = Q(:,k)/R(k,k);
        end
    %Se toma el tiempo al final de la ejecucion
    timeGS = toc();
end