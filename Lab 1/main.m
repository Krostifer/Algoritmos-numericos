%Punto inicial
x0 = 5;
%Tolerancia para el calculo
tol = 0.000000001;
%Cantidad de iteraciones maximas para los metodos
iteraciones = 1000;

%Funcion f1
f1 = @(x) (x^2)-60;
%Primera derivada de la funcion f1
df1 = @(x) 2*x;
%Segunda derivada de la funcion f1
ddf1 = @(x) 2;   

%Funcion f2
f2 = @(x) (x^3) - 2*(x^2) + log(2*x + 1);
%Primera derivada de la funcion f2
df2 = @(x) 3*x^2 - 4*x + (2/(2*x+1));
%Segunda derivada de la funcion f2
ddf2 = @(x)  6*x - 4 - (4/((2*x+1)^2));


%Punto inicial de f2 con el metodo de biseccion
a1 = 5;
%Punto final para f2 con el metodo de biseccion
b1 = 10;

%Punto inicial de f2 con el metodo de biseccion
a2 = -0.4;
%Punto final para f2 con el metodo de biseccion
b2 = 2;

%Ejecucion de los metodos

%%%%%%%%%%%%%%%%%%%%% NewtonRaphson %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Llamada de NewtonRaphson con f1
[SNR1, convergenciaNR1, errorNR1, ePrioriNR1, timeNR1] = newtonRaphson(x0, tol, iteraciones, f1, df1, ddf1, 7.7);
%Se cuentan las operaciones de NewtonRaphson con f1
[contadorNR1] = contadorOperacionesNR(x0, tol, iteraciones, f1, df1);
%Llamada de NewtonRaphson con f2
[SNR2, convergenciaNR2, errorNR2, ePrioriNR2, timeNR2] = newtonRaphson(x0, tol, iteraciones, f2, df2, ddf2, 0.5);
%Se cuentan las operaciones de NewtonRaphson con f2
[contadorNR2] = contadorOperacionesNR(x0, tol, iteraciones, f2, df2);


%%%%%%%%%%%%%%%%%%%%% Biseccion %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Calculamos el error a priori para f1 con 30 iteraciones y para f2 con 31 iteraciones. Valores obtenidos en
%pruebas de ejecucion anteriores
prioriB1 = 2^-(30+1)*(b1 - a1);
prioriB2 = 2^-(31+1)*(b1 - a1);

%Llamada de Biseccion con f1
[SB1, convergenciaB1, errorB1, timeB1] = biseccion(a1, b1, tol, iteraciones, f1);
%Se cuentan las operaciones de Biseccion con f1
[contadorB1] = contadorOperacionesB(a1, b1, tol, iteraciones, f1);
%Llamada de Biseccion con f2
[SB2, convergenciaB2, errorB2, timeB2] = biseccion(a2, b2, tol, iteraciones, f2);
%Se cuentan las operaciones de Biseccion con f2
[contadorB2] = contadorOperacionesB(a2, b2, tol, iteraciones, f2);

%%%%%%%%%%%%%%%%%%%%% Secante %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Llamada de Secante con f1
[SS1, convergenciaS1, errorS1, ePrioriS1, timeS1] = secante(a1, b1, tol, iteraciones, f1, df1, ddf1, 7.7);
%Se cuentan las operaciones de Secante con f1
[contadorS1] = contadorOperacionesS(a1, b1, tol, iteraciones, f1);
%Llamada de Secante con f2
[SS2, convergenciaS2, errorS2, ePrioriS2, timeS2] = secante(a2, b2, tol, iteraciones, f2, df2, ddf2, 0.5);
%Se cuentan las operaciones de Secante con f2
[contadorS2] = contadorOperacionesS(a2, b2, tol, iteraciones, f2);

%%%%%%%%%%%%%%%%%%%%% RegulaFalsi %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Calculamos el error a priori para f1 con 12 iteraciones y para f2 con 47 iteraciones. Valores obtenidos en
%pruebas de ejecucion anteriores
prioriRF1 = 2^-(12+1)*(b1 - a1);
prioriRF2 = 2^-(47+1)*(b1 - a1);

%Llamada de RegulaFalsi con f1
[SRF1, convergenciaRF1, errorRF1, timeRF1] = regulaFalsi(a1, b1, tol, iteraciones, f1);
%Se cuentan las operaciones de RegulaFalsi con f1
[contadorRF1] = contadorOperacionesRF(a1, b1, tol, iteraciones, f1);
%Llamada de RegulaFalsi con f2
[SRF2, convergenciaRF2, errorRF2, timeRF2] = regulaFalsi(a2, b2, tol, iteraciones, f2);
%Se cuentan las operaciones de RegulaFalsi con f2
[contadorRF2] = contadorOperacionesRF(a2, b2, tol, iteraciones, f2);


%%%%%%%%%%%%%%%%%%%%% Visualizacion de datos %%%%%%%%%%%%%%%%%%%%%

%Tabla f1

Metodo = {'Newton Raphson'; 'Bisección';'Secante';'Regula Falsi'};
CostoTemporal = [timeNR1; timeB1; timeS1; timeRF1];
CostoEspacial = [contadorNR1; contadorB1; contadorS1; contadorRF1];
Error = [errorNR1(end); errorB1(end); errorS1(end); errorRF1(end)];
ErrorPriori = [ePrioriNR1(4); prioriB1; ePrioriS1(end); prioriRF1];
T1 = table(Metodo, CostoTemporal, CostoEspacial, Error, ErrorPriori)

%Tabla f2

Metodo = {'Newton Raphson'; 'Bisección';'Secante';'Regula Falsi'};
CostoTemporal = [timeNR2; timeB2; timeS2; timeRF2];
CostoEspacial = [contadorNR2; contadorB2; contadorS2; contadorRF2];
Error = [errorNR2(end); errorB2(end); errorS2(end); errorRF2(end)];
ErrorPriori = [ePrioriNR2(17); prioriB2; ePrioriS2(end); prioriRF2];
T2 = table(Metodo, CostoTemporal, CostoEspacial, Error, ErrorPriori)
