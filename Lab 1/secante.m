function [xn, convergencia, error, erroresPriori, time] = secante(x0, x1, tol, iteraciones, f, df, ddf, r)
%Se toma el tiempo del inicio de la funcion
tic;
%Se establecen el valores iniciales
xn = x0;
e = abs(f(x0));
iter = 0;
%Se inicializan los arreglos de los retornos
convergencia = [];
error = [];
erroresPriori = [];

%Datos para el calculo del error a priori
en0 = e;

%Ya que debemos conocer el valor de en-1 para el calculo del error a
%priori, realizamos un ciclo fuera
xn = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0) + 0.000000000000001);
x1 = x0;
x0 = xn;


e = abs(f(xn));
error = [error, e];
convergencia = [convergencia, xn];
iter = iter + 1;

%Ahora calculamos el error a priori
ePrioriS = 1/2 * (ddf(r) / df(r)) *en0 * e;
erroresPriori = [erroresPriori, ePrioriS];

while (e > tol && iter < iteraciones)

    xn = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0) + 0.000000000000001);
    x1 = x0;
    x0 = xn;
    
    
    e = abs(f(xn));
    error = [error, e];
    convergencia = [convergencia, xn];
    iter = iter + 1;

    %Ahora calculamos el error a priori
    ePrioriS = 1/2 * (ddf(r) / df(r)) *en0 * e;
    erroresPriori = [erroresPriori, ePrioriS];

end
%Se toma el tiempo al final del proceso
time = toc;

end