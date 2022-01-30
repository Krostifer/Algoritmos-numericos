function [coefMejorAprox, MSEMejorAprox, errorABS, matrizAprox] = simulacionP3(x, s)    

    %Polinomio de grado 3
    p3 = @(a0, a1, a2, a3, x) a0 + a1*x + a2*power(x,2) + a3*power(x,3);
    
    a = -5;    
    b = 5;     
    n = 1000;   %numeros aleatorios a generar
    c = 4;      %coeficientes a generar
    
    matrizCoeficientes = [];
    
    %Tipo de generador para los numeros random

    % rng(0, 'twister'); %Mejor MSE=151.31, Mejor ABS=81.7
    % rng(0, "simdTwister"); %Mejor MSE=261.3522, Mejor ABS=143.7274
    % rng(0, "combRecursive"); %Mejor MSE =1.307292182576692e+03 , Mejor ABS=700.3801
    % rng(0, "multFibonacci"); %Mejor MSE =1.620356223032298e+02 , Mejor ABS=90.5662
    rng(0, "philox"); %Mejor MSE = 1.509596488474112e+02, Mejor ABS= 81.4685
    % rng(0, "threefry"); %Mejor MSE = 1.678972989630866e+02, Mejor ABS= 94.2818
    % rng(0, "v4"); %Mejor MSE = 1.554087882534839e+02, Mejor ABS=84.7531
    % rng(0, "v5normal"); %Mejor MSE = 3.946803076024311e+02, Mejor ABS=222.4004
    % rng(0, "v5uniform"); %Mejor MSE = 2.344561378453491e+02, Mejor ABS=133.8759
    
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
            aproximacion = p3(a0, a1, a2, a3, x);
            
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
    aproximacionMejoresCoef = p3(a0, a1, a2, a3, x);
    errorABS = sum(abs(s - aproximacionMejoresCoef(1, :)))/1000
end

