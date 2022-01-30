function [x, operaciones] = operacionesSOR(A, b, tol, nmaxiter, w)
    n = size(A, 1);
    operaciones = 6 + n;
    iter = 1;
    errores(1) = 1.0;  
    operaciones = operaciones + 2;
    x0 = zeros(n, 1);
    operaciones = operaciones + 6 + n;
    x = x0;
    operaciones = operaciones + 1;

    while((errores(iter) > tol) && (iter < nmaxiter))
        for(i = 1:n)
            soma = 0.0;
            operaciones = operaciones + 1;
            for(j = 1:(i-1))
                soma = soma + A(i,j)*x(j);
                operaciones = operaciones + 4;
            end
            for(j = (i+1):n)
                soma = soma + A(i,j)*x0(j);
                operaciones = operaciones + 4;
            end
            x(i) = w*(b(i) - soma)/A(i,i) + (1-w)*x0(i);
            operaciones = operaciones + 7;
        end
        iter = iter + 1;
        operaciones = operaciones + 2;
        errores(iter) = norm(x-x0 ,inf)/norm(x, inf);
        operaciones = operaciones + 6 + 6 + 2;
        x0 = x;
        operaciones = operaciones + 1;
    end
end