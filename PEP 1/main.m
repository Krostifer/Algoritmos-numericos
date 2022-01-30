%Se cargan los datos
A = load('A1089.dat');
b = load('b1089.dat');

%Vector lleno de 1's para el metodo Jacobi
x0 = ones(1089, 1);

%Matrices para almacenar las medias de los metodos
mediasCrout = [];
mediasJacobi = [];
mediasGramSchmidt = [];

%Matrices para almacenar los errores de los metodos
erroresCrout = [];
erroresJacobi = [];
erroresGramSchmidt = [];

%Matrices para almacenar los tiempos de los metodos
tiemposCrout = [];
tiemposJacobi = [];
tiemposGramSchmidt = [];

%Matrices para almacenar las operaciones de los metodos
operacionesCrout = [];
operacionesJacobi = [];
operacionesGramSchmidt = [];

%Ejecucion de los tres metodos 
for i = 1:100

    %Metodo de Crout

    [L, U, timeC] = Crout(A);
    %Se termina de calculas las soluciones del metodo
    Y = inv(L)*b;
    SolCrout = inv(U)*Y;
    %Se almacena el tiempo de ejecucion
    tiemposCrout = [tiemposCrout, timeC];
    %Se calcula el y almacena el error
    errorC = norm(A*SolCrout-b, 2);
    erroresCrout = [erroresCrout, errorC];
    %Se calcula y almacena la media de las soluciones
    mediasCrout = [mediasCrout, mean(SolCrout)];  
   
    %Metodo Jacobi

    [SolJacobi, paso, timeJ] = Jacobi(A, b, x0, 1000, 0.0000000001);
    %Se almacena el tiempo de ejecucion
    tiemposJacobi = [tiemposJacobi, timeJ];
    %Se calcula y almacena el error
    errorJ = norm(A*(SolJacobi')-b, 2);
    erroresJacobi = [erroresJacobi, errorJ];
    %Se calcula y almacena la media de las soluciones
    mediasJacobi = [mediasJacobi, mean(SolJacobi)];

    %Metodo Gram-Schmidt

    [Q, R, timeGS] = GramSchmidt(A);
    %Se termina de calcular las soluciones del metodo
    SolGramSchmidt = inv(R) * Q' * b;
    %Se almacena el tiempo de ejecucion
    tiemposGramSchmidt = [tiemposGramSchmidt, timeGS];
    % Se calcula y almacena el error
    errorGS = norm(A*SolGramSchmidt-b, 2);
    erroresGramSchmidt = [erroresGramSchmidt, errorGS];
    %Se calcula y almacena la media de las soluciones
    mediasGramSchmidt = [mediasGramSchmidt, mean(SolGramSchmidt)];
    %Se rota el vector b
    b = circshift(b, 1);

    i
end

%Visualizacion de los datos

%Matriz que contiene la media de las soluciones para todos los metodos
mediasMetodos = [mediasCrout(:), mediasJacobi(:), mediasGramSchmidt(:)];
%Creacion del grafico
createfigureMedias(mediasMetodos);

%Matriz que contiene el valor de los errores para todos los metodos
erroresMetodos = [erroresCrout(:), erroresJacobi(:), erroresGramSchmidt(:)];
%Creacion del grafico
createfigureErrores(erroresMetodos);

%Matriz que contiene el valor de los costos temporales para todos los metodos
tiemposMetodos = [tiemposCrout(:), tiemposJacobi(:), tiemposGramSchmidt(:)];
%Creacion del grafico
createfigureTiempos(tiemposMetodos);

%Costos operacionales (En caso de no querer calcular los costos operacionales comentar esta seccion y la generacion del grafico)
for j = 1:100

    %Metodo de Crout

    [L, U, operacionesC] = contarOperacionesCrout(A);
    %Se termina de calculas las soluciones del metodo
    Y = inv(L)*b;
    SolCrout = inv(U)*Y;
    %Se almacena el costo operacional, se suma 10 por las operaciones que se realizan fuera de la funcion
    operacionesCrout = [operacionesCrout, (operacionesC + 10)];
    
    %Metodo Jacobi

    [X, paso, operacionesJ] = contarOperacionesJacobi(A, b, x0, 1000, 0.0000000001);
    %Se almacena el costo operacional
    operacionesJacobi = [operacionesJacobi, operacionesJ];

    %Metodo Gram-Schmidt

    [Q, R, operacionesGS] = contarOperacionesGramSchmidt(A);
    %Se termina de calcular las soluciones del metodo
    SolGramSchmidt = inv(R) * Q' * b;
    %Se almacena el costo operacional, se suma 6 por las operaciones que se realizan fuera de la funcion
    operacionesGramSchmidt = [operacionesGramSchmidt, (operacionesGS + 6)];
   
    b = circshift(b, 1);

    j
end

%Matriz que contiene el valor de los costos operacionales para todos los metodos
operacionesMetodos = [operacionesCrout(:), operacionesJacobi(:), operacionesGramSchmidt(:)];
%Creacion del grafico
createfigureOperaciones(operacionesMetodos);