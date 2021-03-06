function [x, tiempo] = SOR(A, b, tol, nmaxiter, w)
    tic();
    n = size(A, 1);
    iter = 1;
    errores(1) = 1.0;  
    x0 = zeros(n, 1);
    x = x0;

    while((errores(iter) > tol) && (iter < nmaxiter))
        for(i = 1:n)
            soma = 0.0;
            for(j = 1:(i-1))
                soma = soma + A(i,j)*x(j);
            end
            for(j = (i+1):n)
                soma = soma + A(i,j)*x0(j);
            end
            x(i) = w*(b(i) - soma)/A(i,i) + (1-w)*x0(i);
        end
        iter = iter + 1;
        errores(iter) = norm(x-x0 ,inf)/norm(x, inf);
        x0 = x;
    end
    tiempo = toc();
end