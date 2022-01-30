% Metodo de sustitucion regresiva para
% sistemas de ecuaciones lineales
function [x] = sustitucionRegresiva(A, b)
    tam = length(b);
    x = zeros(tam,1);
    x(tam) = b(tam)/A(tam,tam);
    
    for k = tam-1:-1:1
        suma = x(k+1:tam)'*A(k,k+1:tam)';
        x(k) = (b(k)-suma)/A(k,k);
    end
end
