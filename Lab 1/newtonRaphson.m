function [x, convergencia, error, erroresPriori, time] = newtonRaphson (x0, tol, iteraciones, f, df, ddf, r)
%Se toma el tiempo del inicio de la funcion
tic;

%Se establecen el valores iniciales
x = x0;
e = abs(f(x));
iter = 0;
%Se inicializan los arreglos de los retornos
convergencia = [];
error = [];
erroresPriori = [];

%Datos para el calculo del error a priori
ePrioriNR = 1/2 * (ddf(r)/df(r)) * (e^2);

while (e > tol && iter < iteraciones)
    x = x - f(x)/df(x);
    e = abs(f(x));
    
    error = [error, e];
    convergencia = [convergencia, x];
    
    iter = iter + 1;

    %actualizacion del error a priori
    ePrioriNR = 1/2 * (ddf(r)/df(r)) * (e^2);
    erroresPriori = [erroresPriori, ePrioriNR];
end

%Se toma el tiempo al termino del proceso
time = toc;

end