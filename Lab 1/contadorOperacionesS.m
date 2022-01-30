function [contador] = contadorOperacionesS(x0, x1, tol, iteraciones, f)

%Para contar la cantidad de operaciones se utilizara el siguiente criterio
%1 = operaciones aritmeticas basicas (+, -, *, /), asignaciones, comparaciones
%2 = inicializar arreglos
%3 = llamado a funciones

%Se toma el tiempo del inicio de la funcion
tic;                                                                        %3

xn = x0;                                                                    %1
e = abs(f(x0));                                                             %4
iter = 0;                                                                   %1
convergencia = [];                                                          %2
error = [];                                                                 %2

contador = 13;

while (e > tol && iter < iteraciones)                                       %2

    xn = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0) + 0.000000000000001);      %7
    x1 = x0;                                                                %1
    x0 = xn;                                                                %1
    
    
    e = abs(f(xn));                                                         %4
    error = [error, e];                                                     %1
    convergencia = [convergencia, xn];                                      %1
    iter = iter + 1;                                                        %2

    contador = contador + 19;

end
%Se toma el tiempo al final del proceso
time = toc;                                                                 %3

contador = contador + 3;

end