%Factorización LU por el método de Crout
function [L, U, contador] = operacionesCrout(A)
    contador = 0;
    %Se comprueba que se haya entregado la matriz
    if nargin < 1                                                             %1
        error('No ha introducido la matriz de entrada');                %1
        
    else
        [cols, filas]=size(A);                                              %4
        contador = contador + 5;

        if cols~=filas                                                      %1
            contador = contador + 2;
            error('La matriz no es cuadrada');                          %1
            
        else
            
            L=zeros(cols);                                                  %3
            U=zeros(cols);                                                  %3
            U(1,1)=1;                                                       %1
            L(1,1)=A(1,1);                                                  %1
            contador = contador + 9;

            for i=2:cols                                                    %1
                U(i,i)=1;                                               %1
                L(i,1)=A(i,1);                                          %1
                U(1,i)=A(1,i)/L(1,1);                                   %2
                contador = contador + 4;
            end

            contador = contador + 1;

            for j=2:cols                                                    %1

                for i=j:cols                                            %1
                    sumal=0;                                        %1
                    sumau=0;                                        %1
                    contador = contador + 2;

                    for k=1:j-1                                     %2

                        if (L(i,k)~=0)&&(U(k,j)~=0)                 %3
                            sumal=sumal+L(i,k)*U(k,j);           %4
                            contador = contador + 7;
                        end
                        contador = contador + 3;

                        if (L(j,k)~=0)&&(U(k,i)~=0)                 %3
                            sumau=sumau+L(j,k)*U(k,i);          %4
                            contador = contador + 7;
                        end
                        contador = contador + 3;
                    end

                    L(i,j)=A(i,j)-sumal;                            %2
                    contador = contador + 2;

                    if (j<cols)&&(i>j)                              %3
                        U(j,i)=(A(j,i)-sumau)/L(j,j);           %3
                        contador = contador + 6;
                    end
                    contador = contador + 3;

                end

            end

        end

    end
    
end