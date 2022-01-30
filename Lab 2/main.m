%Se importan los datos del archivo
casosTotalesAcumulativoData = importfile("CasosTotalesCumulativo.csv", [2, Inf]);
%Se guardan los nombres de cada una de las filas
regiones = casosTotalesAcumulativoData(:, 1);
%Se almacena la cantidad de casos totales por dia
totales = casosTotalesAcumulativoData(end, 2:end);
totales = totales{:,:};
%Se almacena la cantidad de casos por dia de cada region
casosAcumulativos = casosTotalesAcumulativoData(:, 2:end);
casosAcumulativos = casosAcumulativos{:,:};
casosAcumulativosT = casosAcumulativos';

vectorDiarioCasos = (casosAcumulativos(:,2:end)) - (casosAcumulativos(:,1:end-1));
vectorDiarioCasosT = vectorDiarioCasos';

%Matriz con los vectores que almacenan los datos originales, pero cada 4 dias
matrizDiariaEspaciada = [];
%Se crea el vector espaciado para fila
for j=1:17
    vectorParcial = vectorDiarioCasos(j, 1:4:end);
    matrizDiariaEspaciada = vertcat(matrizDiariaEspaciada, vectorParcial);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Interpolacion spline

%Matriz para almacenar las interpolaciones de cada fila
interpolacion1 = [];

%Se interpola cada una de las filas
for i=1:17
    x = 1:1:size(matrizDiariaEspaciada, 2);
    xq = 1:0.2500:size(matrizDiariaEspaciada, 2);
    interParcial = interp1(x, matrizDiariaEspaciada(i, :), xq, "spline");
    interpolacion1 = vertcat(interpolacion1, interParcial);

end

%Se traspone para graficar
interpol1T = interpolacion1';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Interpolacion lineal

%Matriz para almacenar las interpolaciones de cada fila
interpolacion2 = [];

%Se interpola cada una de las filas
for i=1:17
    x = 1:1:size(matrizDiariaEspaciada, 2);
    xq = 1:0.2500:size(matrizDiariaEspaciada, 2);
    interParcial = interp1(x, matrizDiariaEspaciada(i, :), xq, "linear");
    interpolacion2 = vertcat(interpolacion2, interParcial);

end

%Se traspone para graficar
interpol2T = interpolacion2';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Interpolacion pchip

%Matriz para almacenar las interpolaciones de cada fila
interpolacion3 = [];

%Se interpola cada una de las filas
for i=1:17
    x = 1:1:size(matrizDiariaEspaciada, 2);
    xq = 1:0.2500:size(matrizDiariaEspaciada, 2);
    interParcial = interp1(x, matrizDiariaEspaciada(i, :), xq, "pchip");
    interpolacion3 = vertcat(interpolacion3, interParcial);

end

%Se traspone para graficar
interpol3T = interpolacion3';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Comprobacion de integrales

integralesOriginales = [];
for k=1:17
    integralParcial = ceil(trapz(vectorDiarioCasos(k, 1:681)));
    integralesOriginales = vertcat(integralesOriginales, integralParcial);
end

integralesInter1 = [];
for k=1:17
    integralParcial = ceil(trapz(interpolacion1(k, 1:end)));
    integralesInter1 = vertcat(integralesInter1, integralParcial);
end

integralesInter2 = [];
for k=1:17
    integralParcial = ceil(trapz(interpolacion2(k, 1:end)));
    integralesInter2 = vertcat(integralesInter2, integralParcial);
end

integralesInter3 = [];
for k=1:17
    integralParcial = ceil(trapz(interpolacion3(k, 1:end)));
    integralesInter3 = vertcat(integralesInter3, integralParcial);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Errores

integrales = vertcat(integralesOriginales', integralesInter1', integralesInter2', integralesInter3')';
errores1 = sum(abs(integralesOriginales - integralesInter1));
errores2 = sum(abs(integralesOriginales - integralesInter2));
errores3 = sum(abs(integralesOriginales - integralesInter3));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Graficos

%Acumulados
createfigureAcumulados(casosAcumulativosT);
%Diario
createfigureDiario(vectorDiarioCasosT);
%Comparacion interpolacion RM
comparacionRM = vertcat(vectorDiarioCasos(7, 1:681), interpolacion1(7, :), interpolacion2(7, :), interpolacion3(7, :));
comparacionRMT = comparacionRM';
createfigureComparacionRM(comparacionRMT);
%integrales
createfigureIntegrales(integrales);



