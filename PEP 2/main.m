%% Carga de los datos y valores iniciales
acumulativoVal = importfile1("CasosTotalesCumulativo.csv", [7, 7]);

%Se calcula el vector diario
vectorDiarioVal = (acumulativoVal(:,2:end)) - (acumulativoVal(:,1:end-1));


%Se ajusta la curva
curvaAjustadaVal = ceil(conv(vectorDiarioVal, [1 1 1 1 1 1 1 1 1 1 1 1 1 1]/14));

x = 1:1:697;
s = curvaAjustadaVal;   %target

%% Se realizan las simulaciones con los diferentes polinomios

%Simulacion polinomio de grado 3
tic();
[mejoresCoefP3, mejorMSEP3, mejorABSP3, matrizAproxP3] = simulacionP3(x, s);
tiempoP3 = toc();

%Simulacion polinomio de grado 9
tic();
[mejoresCoefP9, mejorMSEP9, mejorABSP9, matrizAproxP9] = simulacionP9(x, s);
tiempoP9 = toc();

%Simulacion polinomio de grado 18
tic();
[mejoresCoefP18, mejorMSEP18, mejorABSP18, matrizAproxP18] = simulacionP18(x, s);
tiempoP18 = toc();

%% Generacion de graficos

%Vector diario vs curva ajustada

curvaAjustadaCortada = curvaAjustadaVal(1, 1:size(vectorDiarioVal, 2));
ajustadaDiaria = [vectorDiarioVal; curvaAjustadaCortada]';
createfigureDiarioAjustado(ajustadaDiaria)

%Comparacion generadores

comparacionGeneradores = [151.31 81.7; 261.3522 143.7274; 1307.2921 700.2801; 162.0356 90.5662; 150.9596 81.4685; 167.8972 94.2818; 155.4087 84.7531; 394.6803 222.4004; 234.4561 133.8759];
createfigureGeneradores(comparacionGeneradores)

%Distribucion datos iniciales

rng(0, "philox"); 
a = -5;
b = 5;
c = 4;
matrizDistribucion = [];

for i = 1:1000
    r = (b-a).*rand(c, 1) + a;
    matrizDistribucion = [matrizDistribucion, r];
    
end

createfigureDistribucion(matrizDistribucion')

%Comparacion aproximaciones

%Creacion de las matrices comparativas
mejorAproxP3 = sortrows(matrizAproxP3, 1);
mejorAproxP3 = mejorAproxP3(1, 1:end);
comparacionCurvasP3 = [curvaAjustadaVal; mejorAproxP3];

mejorAproxP9 = sortrows(matrizAproxP9, 1);
mejorAproxP9 = mejorAproxP9(1, 1:end);
comparacionCurvasP9 = [curvaAjustadaVal; mejorAproxP9];

mejorAproxP18 = sortrows(matrizAproxP18, 1);
mejorAproxP18 = mejorAproxP18(1, 1:end);
comparacionCurvasP18 = [curvaAjustadaVal; mejorAproxP18];

%Graficos
createfigureComparacionCurvasP3(comparacionCurvasP3')
createfigureComparacionCurvasP9(comparacionCurvasP9')
createfigureComparacionCurvasP18(comparacionCurvasP18')

%Compararion errores

comparacionErroresMSE = [mejorMSEP3 ; mejorMSEP9 ; mejorMSEP18];
createfigureErrorMSE(comparacionErroresMSE);

comparacionErroresABS = [mejorABSP3 ; mejorABSP9 ; mejorABSP18];
createfigureErrorABS(comparacionErroresABS);

%Comparacion tiempo

comparacionTiempo = [tiempoP3; tiempoP9; tiempoP18];
createfigureTiempos(comparacionTiempo);


