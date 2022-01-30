% Metodo de sustitucion regresiva para
% sistemas de ecuaciones lineales
function [x, operaciones] = operacionesSustitucionRegresiva(A, b)
    tam = length(b);
    x = zeros(tam,1);
    operaciones = 6 + 6 + tam;
    x(tam) = b(tam)/A(tam,tam);
    operaciones = operaciones + 2;
    for k = tam-1:-1:1
        suma = x(k+1:tam)'*A(k,k+1:tam)';
        operaciones = operaciones + 6 + 2 + (tam - (k+1));
        x(k) = (b(k)-suma)/A(k,k);
        operaciones = operaciones + 3;
    end
end
