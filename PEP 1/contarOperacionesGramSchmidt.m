% Metodo de Gram-Schmidt modificado para hacer la factorizacion QR reducida de una matriz A
function [Q, R, contador] = operacionesGramSchmidt(A)
    contador = 0;
    [m, n] = size(A);                                                               %4
    contador = contador + 4;
        if m < n                                                                    %1
            error('Las dimensiones de la matriz A son incorrectas');            %1
            contador = contador + 2;
        end

        Q = A;                                                                      %1
        R = zeros(n);                                                               %4
        contador = contador + 6;

        for k=1:n                                                                   %1
            for i=1:k-1                                                         %2
                R(i,k) = Q(:,i)'*Q(:,k);                                    %3
                Q(:,k) = Q(:,k) - Q(:,i)*R(i,k);                            %3
                contador = contador + 8;
            end
            contador = contador + 2;

            R(k,k) = norm(Q(:,k));                                              %4
            Q(:,k) = Q(:,k)/R(k,k);                                             %2

            contador = contador + 6;
        end

end