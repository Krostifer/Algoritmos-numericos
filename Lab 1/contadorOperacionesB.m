function [contador] = contadorOperacionesB (a, b, tol, iteraciones, f)
%Para contar la cantidad de operaciones se utilizara el siguiente criterio
%1 = operaciones aritmeticas basicas (+, -, *, /), asignaciones, comparaciones
%2 = inicializar arreglos
%3 = llamado a funciones


tic;                                                    %3

c = a;                                                  %1
e = abs(f(c));                                          %4
iters = 0;                                              %1
convergencia = [];                                      %2
error = [];                                             %2

contador = 13;

while ( e > tol && iters < iteraciones)                 %2
    c = a + (b-a)/2;                                    %4
    
    if (f(c) == 0)                                      %1
        a = c;                                     %1
        b = c;                                     %1

        contador = contador + 2;
    end
    
    if(sign(f(a)) == sign(f(c)))                        %7
        a = c;                                     %1

        contador = contador + 1;
    end
    
    if (sign(f(b)) == sign(f(c)))                       %7
        b = c;                                     %1

        contador = contador + 1;
    end
    
    e = abs(f(c));                                      %4
    error = [error, e];                                 %1
    convergencia = [convergencia, c];                   %1  
    iters = iters + 1;                                  %2

    contador = contador + 29;
end
%Se toma el tiempo al final del proceso
time = toc;                                             %4

contador = contador + 4;

end