function [contador] = contadorOperacionesNR (x0, tol, iteraciones, f, df)

%Para contar la cantidad de operaciones se utilizara el siguiente criterio
%1 = operaciones aritmeticas basicas (+, -, *, /), asignaciones, comparaciones
%2 = inicializar arreglos
%3 = llamado a funciones


tic;                                        %3
x = x0;                                     %1
e = abs(f(x));                              %4
iter = 0;                                   %1
convergencia = [];                          %2
error = [];                                 %2

contador = 13;

while (e > tol && iter < iteraciones)       %2
    x = x - f(x)/df(x);                     %3
    e = abs(f(x));                          %4
    
    error = [error, e];                     %1
    convergencia = [convergencia, x];       %1
    
    iter = iter + 1;                        %2
    contador = contador + 13;
end

time = toc;                                 %4
contador = contador + 4;
end