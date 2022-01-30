 function [coefMejorAprox, MSEMejorAprox, errorABS, matrizAprox] = simulacionP9(x, s)       
    
    %Polinomio de grado 9
    p9 = @(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, x) a0 + a1*x + a2*power(x,2) + a3*power(x,3) + a4*power(x,4) + a5*power(x,5) + a6*power(x,6) + a7*power(x,7) + a8*power(x,8) + a9*power(x,9);
    
    a = -5e-16;    
    b = 5e-16;    
    n = 1000;   %numeros aleatorios a generar
    c = 10;      %coeficientes a generar
    
    matrizCoeficientes = [];
    %Generador a utilizar
    rng(0, "philox");
    
    %% Generacion de numeros aleatorios iniciales
    
    for i = 1:n
        r = (b-a).*rand(c, 1) + a;
        matrizCoeficientes = [matrizCoeficientes, r];
        
    end
    
    %% Ciclo para calcular los coeficientes
    
    for iter = 1:100
        matrizAprox = [];
        
        for j = 1:n
            a0 = matrizCoeficientes(1, j);
            a1 = matrizCoeficientes(2, j);
            a2 = matrizCoeficientes(3, j);
            a3 = matrizCoeficientes(4, j);
            a4 = matrizCoeficientes(5, j);
            a5 = matrizCoeficientes(6, j);
            a6 = matrizCoeficientes(7, j);
            a7 = matrizCoeficientes(8, j);
            a8 = matrizCoeficientes(9, j);
            a9 = matrizCoeficientes(10, j);
            aproximacion = p9(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, x);
            
            matrizAprox = [matrizAprox; aproximacion];
            
        end
        
        matrizErrores = [];
        
        for k = 1:n
            errorMSE = sqrt(mse(s - matrizAprox(k, :)))
            errorABS = sum(abs(s - matrizAprox(k, :)))/1000
            matrizErrores = [matrizErrores; errorMSE, matrizCoeficientes(:, k)'];
        end
        
        %Se ordenan los coeficientes obtenidos segun el error
        rankCoeficientes = sortrows(matrizErrores, 1);
        %Cantidad de coeficientes a guardar para la siguiente iteracion
        coefSeleccionar = ceil(0.15*n);      
        %Se seleccionan los coeficientes con menor error
        seleccion = rankCoeficientes(1:coefSeleccionar, 2:end);
        
        parametros = [];
        
        for i = 1:c
            [muhat, sigmahat] = normfit(seleccion(:, i));
            parametros = [parametros; muhat, sigmahat];
        end
        
        %% Optimizacion de numeros aleatorios
        
        nuevaData = [];
       
        for i = 1:c
            y = normrnd (parametros(i, 1), parametros(i, 2), [1, n]);   %Funcion de probabilidad
            nuevaData = [nuevaData; y];
        end
        
        matrizCoeficientes = nuevaData; %Se reemplaza con los datos nuevos
        iter
    
    end
    
    mejorAprox = sortrows(matrizErrores, 1);
    coefMejorAprox = mejorAprox(1, 2:end);
    MSEMejorAprox = mejorAprox(1, 1);
    
    a0 = coefMejorAprox(1, 1);
    a1 = coefMejorAprox(1, 2);
    a2 = coefMejorAprox(1, 3);
    a3 = coefMejorAprox(1, 4);
    a4 = coefMejorAprox(1, 5);
    a5 = coefMejorAprox(1, 6);
    a6 = coefMejorAprox(1, 7);
    a7 = coefMejorAprox(1, 8);
    a8 = coefMejorAprox(1, 9);
    a9 = coefMejorAprox(1, 10);
    aproximacionMejoresCoef = p9(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, x);
    
    errorABS = sum(abs(s - aproximacionMejoresCoef(1, :)))/1000
end