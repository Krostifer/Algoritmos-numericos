function [x, operaciones] = operacionesSustitucionProgresiva(A, b)
    %Tamanio del vector b
    tam = length(b);
    % Vector de soluciones
    x = zeros(tam,1);
    operaciones = 6 + 6 + tam;
    x(1) = b(1)/A(1,1);
    operaciones = operaciones + 2;
    for k = 2:1:tam
        suma = x(1:k-1)' *A(k,1:k-1)';
        operaciones = operaciones + 6 + 2 + (k-1);
        x(k) = (b(k)-suma)/A(k,k);
        operaciones = operaciones + 3;
    end
end