function [c,convergencia,error, time] = regulaFalsi(a, b, tol, iteraciones, f)
%Se toma el tiempo del inicio de la funcion
tic;

%Se establecen el valores iniciales
c = a;
e = abs(f(c));
iter = 0;
%Se inicializan los arreglos de los retornos
convergencia = [];
error = [];

while (e > tol && iter < iteraciones )

    c = b - f(b) * (b - a) / (f(b) - f(a));
    
    if f(c) == 0
        a = c;
        b = c;
    end
    
    if sign(f(a)) == sign(f(c))
        a=c;
    end
    
    if sign(f(b)) == sign(f(c))
        b=c;
    end
    
    e = abs(f(c));
    error = [error, e];    
    convergencia = [convergencia, c]; 
    iter = iter + 1;

end
%Se toma el tiempo al final del proceso
time = toc;

end
