% Se cargan los datos de las matrices y se establecen valores iniciales

A289 = load('A289.dat');
b289 = load('b289.dat');
A1089 = load('A1089.dat');
b1089 = load('b1089.dat');
A4225 = load('A4225.dat');
b4225 = load('b4225.dat');

tolerancia = 1e-20;
tolerancia2 = 1e-8;
iteraciones = 1000;
x0289 = A289(:,1);
x01089 = A1089(:,1);
x04225 = A4225(:,1);


%% Obtencion de las soluciones y tiempo matriz 289x289

%% Metodo LU

tic();
%Factorizacion LU
[L289, U289] = LU(A289);
%Solucion
y = sustitucionProgresiva(L289, b289);
XLU289 = sustitucionRegresiva(U289, y);
%Toma de tiempo
tiempoLU289 = toc();
%Error
errorLU289 = norm(A289 * XLU289 - b289);

%% Metodo Cholesky

%Factorizacion L
tic();
[LCholesky289] = Cholesky(A289);
%Solucion
y = sustitucionProgresiva(LCholesky289, b289);
XCholesky289 = sustitucionRegresiva(LCholesky289', y);
%Toma de tiempo
tiempoCholesky289 = toc();
%Error
errorCholesky289 = norm(A289 * XCholesky289 - b289);


%% Metodo QR

%Transformacion ortogonal
tic();
[Q289, R289] = QR(A289);
%Solucion
XQR289 = sustitucionRegresiva(R289, Q289'*b289);
%Toma de tiempo
tiempoQR289 = toc();
%Error
errorQR289 = norm(A289 * XQR289 - b289);

%% Metodo Jacobi

[XJacobi289, tiempoJacobi289] = Jacobi(A289, b289, x0289, iteraciones, tolerancia);
%Error
errorJacobi289 = norm(A289 * XJacobi289' - b289);

%% Metodo Jacobi - Seidel

[XJacobiSeidel289, tiempoJacobiSeidel289] = JacobiSeidel(A289, b289, x0289, iteraciones);
%Error
errorJacobiSeidel289 = norm(A289 * XJacobiSeidel289' - b289);

%% Metodo SOR

[XSOR289, tiempoSOR289]  = SOR(A289, b289, tolerancia, iteraciones, 1.5);
%Error
errorSOR289 = norm(A289 * XSOR289 - b289);


%% Obtencion de las soluciones y tiempo matriz 1089x1089

%% Metodo LU

tic();
%Factorizacion LU
[L1089, U1089] = LU(A1089);
%Solucion
y = sustitucionProgresiva(L1089, b1089);
XLU1089 = sustitucionRegresiva(U1089, y);
%Toma de tiempo
tiempoLU1089 = toc();
%Error
errorLU1089 = norm(A1089 * XLU1089 - b1089);

%% Metodo Cholesky

%Factorizacion L
tic();
[LCholesky1089] = Cholesky(A1089);
%Solucion
y = sustitucionProgresiva(LCholesky1089, b1089);
XCholesky1089 = sustitucionRegresiva(LCholesky1089', y);
%%Toma de tiempo
tiempoCholesky1089 = toc();
%Error
errorCholesky1089 = norm(A1089 * XCholesky1089 - b1089);

%% Metodo QR

%Transformacion ortogonal
tic();
[Q1089, R1089] = QR(A1089);
%Solucion
XQR1089 = sustitucionRegresiva(R1089, Q1089'*b1089);
%Toma de tiempo
tiempoQR1089 = toc();
%Error
errorQR1089 = norm(A1089 * XQR1089 - b1089);


%% Metodo Jacobi

[XJacobi1089, tiempoJacobi1089] = Jacobi(A1089, b1089, x01089, iteraciones, tolerancia);
%Error
errorJacobi1089 = norm(A1089 * XJacobi1089' - b1089);

%% Metodo Jacobi - Seidel

[XJacobiSeidel1089, tiempoJacobiSeidel1089] = JacobiSeidel(A1089, b1089, x01089, iteraciones);
%Error
errorJacobiSeidel1089 = norm(A1089 * XJacobiSeidel1089' - b1089);

%% Metodo SOR

[XSOR1089, tiempoSOR1089]  = SOR(A1089, b1089, tolerancia, iteraciones, 1.5);
%Error
errorSOR1089 = norm(A1089 * XSOR1089 - b1089);

%% Obtencion de las soluciones y tiempo matriz 4225x4225

%% Metodo LU

tic();
%Factorizacion LU
[L4225, U4225] = LU(A4225);
%Solucion
y = sustitucionProgresiva(L4225, b4225);
XLU4225 = sustitucionRegresiva(U4225, y);
%Toma de tiempo
tiempoLU4225 = toc();
%Error
errorLU4225 = norm(A4225 * XLU4225 - b4225);

%% Metodo Cholesky

%Factorizacion L
tic();
[LCholesky4225] = Cholesky(A4225);
%Solucion
y = sustitucionProgresiva(LCholesky4225, b4225);
XCholesky4225 = sustitucionRegresiva(LCholesky4225', y);
%Toma de tiempo
tiempoCholesky4225 = toc();
%Error
errorCholesky4225 = norm(A4225 * XCholesky4225 - b4225);

%% Metodo QR

%Transformacion ortogonal
tic();
[Q4225, R4225] = QR(A4225);
%Solucion
XQR4225 = sustitucionRegresiva(R4225, Q4225'*b4225);
%Toma de tiempo
tiempoQR4225 = toc();
%Error
errorQR4225 = norm(A4225 * XQR4225 - b4225);


%% Metodo Jacobi

[XJacobi4225, tiempoJacobi4225] = Jacobi(A4225, b4225, x04225, iteraciones, tolerancia2);
%Error
errorJacobi4225 = norm(A4225 * XJacobi4225' - b4225);

%% Metodo Jacobi - Seidel

[XJacobiSeidel4225, tiempoJacobiSeidel4225] = JacobiSeidel(A4225, b4225, x04225, iteraciones);
%Error
errorJacobiSeidel4225 = norm(A4225 * XJacobiSeidel4225' - b4225);

%% Metodo SOR

[XSOR4225, tiempoSOR4225]  = SOR(A4225, b4225, tolerancia2, iteraciones, 1.5);
%Error
errorSOR4225 = norm(A4225 * XSOR4225 - b4225);

%% Costos espaciales

%% Costos matriz 289x289

% Metodo LU

%Factorizacion LU
[L289, U289, operacionesLU289] = operacionesLU(A289);
%Solucion
[y, operacionesSPLU289] = operacionesSustitucionProgresiva(L289, b289);
[XLU289, operacionesSRLU289] = operacionesSustitucionRegresiva(U289, y);
%Suma de operaciones
operacionesLU289 = operacionesLU289 + operacionesSPLU289 + operacionesSRLU289;

% Metodo Cholesky

%Factorizacion L
[LCholesky289, operacionesCholesky289] = operacionesCholesky(A289);
%Solucion
[y, operacionesSPCholesky289] = operacionesSustitucionProgresiva(LCholesky289, b289);
[XCholesky289, operacionesSRCholesky289] = operacionesSustitucionRegresiva(LCholesky289', y);
%Suma de operaciones
operacionesCholesky289 = operacionesCholesky289 + operacionesSPCholesky289 + operacionesSRCholesky289;


% Metodo QR

%Transformacion ortogonal
[Q289, R289, operacionesQR289] = operacionesQR(A289);
%Solucion
[XQR289, operacionesSRQR289] = operacionesSustitucionRegresiva(R289, Q289'*b289);
%Suma de operaciones
operacionesQR289 = operacionesQR289 + operacionesSRQR289;


% Metodo Jacobi

[XJacobi289, operacionesJacobi289] = operacionesJacobi(A289, b289, x0289, iteraciones, tolerancia);


% Metodo Jacobi - Seidel

[XJacobiSeidel289, operacionesJacobiSeidel289] = operacionesJacobiSeidel(A289, b289, x0289, iteraciones);


% Metodo SOR

[XSOR289, operacionesSOR289]  = operacionesSOR(A289, b289, tolerancia, iteraciones, 1.5);



%% Costos matriz 1089x1089

% Metodo LU

%Factorizacion LU
[L1089, U1089, operacionesLU1089] = operacionesLU(A1089);
%Solucion
[y, operacionesSPLU1089] = operacionesSustitucionProgresiva(L1089, b1089);
[XLU1089, operacionesSRLU1089] = operacionesSustitucionRegresiva(U1089, y);
%Suma de operaciones
operacionesLU1089 = operacionesLU1089 + operacionesSPLU1089 + operacionesSRLU1089;

% Metodo Cholesky

%Factorizacion L
[LCholesky1089, operacionesCholesky1089] = operacionesCholesky(A1089);
%Solucion
[y, operacionesSPCholesky1089] = operacionesSustitucionProgresiva(LCholesky1089, b1089);
[XCholesky1089, operacionesSRCholesky1089] = operacionesSustitucionRegresiva(LCholesky1089', y);
%Suma de operaciones
operacionesCholesky1089 = operacionesCholesky1089 + operacionesSPCholesky1089 + operacionesSRCholesky1089;


% Metodo QR

%Transformacion ortogonal
[Q1089, R1089, operacionesQR1089] = operacionesQR(A1089);
%Solucion
[XQR1089, operacionesSRQR1089] = operacionesSustitucionRegresiva(R1089, Q1089'*b1089);
%Suma de operaciones
operacionesQR1089 = operacionesQR1089 + operacionesSRQR1089;


% Metodo Jacobi

[XJacobi1089, operacionesJacobi1089] = operacionesJacobi(A1089, b1089, x01089, iteraciones, tolerancia);


% Metodo Jacobi - Seidel

[XJacobiSeidel1089, operacionesJacobiSeidel1089] = operacionesJacobiSeidel(A1089, b1089, x01089, iteraciones);


% Metodo SOR

[XSOR1089, operacionesSOR1089]  = operacionesSOR(A1089, b1089, tolerancia, iteraciones, 1.5);

%% Costos matriz 4225x4225

% Metodo LU

%Factorizacion LU
[L4225, U4225, operacionesLU4225] = operacionesLU(A4225);
%Solucion
[y, operacionesSPLU4225] = operacionesSustitucionProgresiva(L4225, b4225);
[XLU4225, operacionesSRLU4225] = operacionesSustitucionRegresiva(U4225, y);
%Suma de operaciones
operacionesLU4225 = operacionesLU4225 + operacionesSPLU4225 + operacionesSRLU4225;

% Metodo Cholesky

%Factorizacion L
[LCholesky4225, operacionesCholesky4225] = operacionesCholesky(A4225);
%Solucion
[y, operacionesSPCholesky4225] = operacionesSustitucionProgresiva(LCholesky4225, b4225);
[XCholesky4225, operacionesSRCholesky4225] = operacionesSustitucionRegresiva(LCholesky4225', y);
%Suma de operaciones
operacionesCholesky4225 = operacionesCholesky4225 + operacionesSPCholesky4225 + operacionesSRCholesky4225;


% Metodo QR

%Transformacion ortogonal
[Q4225, R4225, operacionesQR4225] = operacionesQR(A4225);
%Solucion
[XQR4225, operacionesSRQR4225] = operacionesSustitucionRegresiva(R4225, Q4225'*b4225);
%Suma de operaciones
operacionesQR4225 = operacionesQR4225 + operacionesSRQR4225;


% Metodo Jacobi

[XJacobi4225, operacionesJacobi4225] = operacionesJacobi(A4225, b4225, x04225, iteraciones, tolerancia);


% Metodo Jacobi - Seidel

[XJacobiSeidel4225, operacionesJacobiSeidel4225] = operacionesJacobiSeidel(A4225, b4225, x04225, iteraciones);


% Metodo SOR

[XSOR4225, operacionesSOR4225]  = operacionesSOR(A4225, b4225, tolerancia, iteraciones, 1.5);



%% Generacion de graficos

%Tiempos matriz 289x289
tiempos289 = [tiempoLU289; tiempoCholesky289; tiempoQR289; tiempoJacobi289; tiempoJacobiSeidel289; tiempoSOR289];
createfigureTiempo289(tiempos289)

%Tiempos matriz 1089x1089
tiempos1089 = [tiempoLU1089; tiempoCholesky1089; tiempoQR1089; tiempoJacobi1089; tiempoJacobiSeidel1089; tiempoSOR1089];
createfigureTiempo1089(tiempos1089)

%Tiempos matriz 4225x4225
tiempos4225 = [tiempoLU4225; tiempoCholesky4225; tiempoQR4225; tiempoJacobi4225; tiempoJacobiSeidel4225; tiempoSOR4225];
createfigureTiempo4225(tiempos4225)

%Errores matriz 289x289
errores289 = [errorLU289; errorCholesky289; errorQR289; errorJacobi289; errorJacobiSeidel289; errorSOR289];
createfigureErrores289(errores289)

%Errores matriz 1089x1089
errores1089 = [errorLU1089; errorCholesky1089; errorQR1089; errorJacobi1089; errorJacobiSeidel1089; errorSOR1089];
createfigureErrores1089(errores1089)

%Errores matriz 4225x4225
errores4225 = [errorLU4225; errorCholesky4225; errorQR4225; errorJacobi4225; errorJacobiSeidel4225; errorSOR4225];
createfigureErrores4225(errores4225)

%Operaciones matriz 289x289
operaciones289 = [operacionesLU289; operacionesCholesky289; operacionesQR289; operacionesJacobi289; operacionesJacobiSeidel289; operacionesSOR289];
createfigureOperaciones289(operaciones289)

%Operaciones matriz 1089x1089
operaciones1089 = [operacionesLU1089; operacionesCholesky1089; operacionesQR1089; operacionesJacobi1089; operacionesJacobiSeidel1089; operacionesSOR1089];
createfigureOperaciones1089(operaciones1089)

%Operaciones matriz 4225x4225
operaciones4225 = [operacionesLU4225; operacionesCholesky4225; operacionesQR4225; operacionesJacobi4225; operacionesJacobiSeidel4225; operacionesSOR4225];
createfigureOperaciones4225(operaciones4225)