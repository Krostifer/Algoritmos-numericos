%Factorización LU por el método de Crout
function [L,U, timeC] = Crout(A)
    %Se toma el tiempo de inicio
    tic();
    
    %Se comprueba que se haya entregado la matriz
    if nargin<1
        error('No ha introducido la matriz de entrada');
    else
        [cols, filas]=size(A);

        if cols~=filas
            error('La matriz no es cuadrada');
        else

            L=zeros(cols);
            U=zeros(cols);
            U(1,1)=1;
            L(1,1)=A(1,1);

            for i=2:cols
                U(i,i)=1;
                L(i,1)=A(i,1);
                U(1,i)=A(1,i)/L(1,1);
            end

            for j=2:cols

                for i=j:cols
                    sumal=0;
                    sumau=0;

                    for k=1:j-1

                        if (L(i,k)~=0)&&(U(k,j)~=0)
                            sumal=sumal+L(i,k)*U(k,j);
                        end

                        if (L(j,k)~=0)&&(U(k,i)~=0)
                            sumau=sumau+L(j,k)*U(k,i);
                        end

                    end

                    L(i,j)=A(i,j)-sumal;

                    if (j<cols)&&(i>j)
                        U(j,i)=(A(j,i)-sumau)/L(j,j);
                    end

                end

            end

        end

    end
    %Se toma el tiempo al final de la ejecucion
    timeC = toc();
end