function [X, paso, contador] = operacionesJacobi(A, b, x0, iter, tol )
    contador = 0;

    if nargin < 5                                                   %1
        error('Faltan argumentos de entrada')                   %1
        contador = contador + 2;
        return;
    else
        [cols, filas]=size(A);                                      %3
        contador = contador + 4;
        if cols~=filas                                              %1
            error('La matriz no es cuadrada')                   %1
            contador = contador + 2;
            return;                                     
        else
            contador = contador + 1;
            if (cols~=size(x0)) | (cols~=size(b))                   %8
                error('El sistema no es valido');               %1
            else
                % Generamos las matrices D, L y R
                contador = contador + 8;
                for k=1:cols                                        %1
                    for j=k+1:cols                                  %2
                        if k~=j                                     %1
                            D(j,k)=0;                           %1
                            D(k,j)=0;                           %1
                            L(j,k)=A(j,k);                      %1
                            L(k,j)=0;                           %1
                            R(k,j)=A(k,j);                      %1
                            R(j,k)=0;                           %1
                            contador = contador + 6;
                        end
                        contador = contador + 1;
                    end
                    D(k,k)=A(k,k);                                  %1
                    L(k,k)=0;                                       %1
                    R(k,k)=0;                                       %1
                    contador = contador + 7;
                end
                fin=0;                                              %1
                paso=1;                                             %1
                x(1,:)=x0';                                         %1
                contador = contador + 3;

                % La condicion de parada adicional es que se llegue a la solución exacta
                while (fin==0)&&(paso<=iter)                                                                                %2
                    for componente=1:cols                                                                                   %1
                        vectant=0;                                                                                          %1
                        vectsig=0;                                                                                          %1
                        for k=1:componente-1                                                                                %2
                            vectant=vectant+A(componente,k)*x(paso,k);                                                  %3
                            contador = contador + 5;
                        end
                        contador = contador + 2;

                        for k=componente+1:cols                                                                             %2
                            vectsig=vectsig+A(componente,k)*x(paso,k);                                                  %3
                            contador = contador + 5;
                        end
                        
                        x(paso+1,componente) = (b(componente)-vectant - vectsig)/A(componente,componente);                  %5
                        contador = contador + 7;
                    end
                    
                    % Si la solucion es igual a la anterior, salimos del bucle
                    if x(paso,:)==x(paso+1,:)                                                                               %2
                        fin=1;                                                                                          %1
                        contador = contador + 3;
                    end

                    %Calculamos el eror
                    error = norm(x(paso+1,:) - x(paso,:));                                                                  %6
                    contador = contador + 9;
                    %Si el error es menor a la tolerancia, salimos del bucle
                    if(error < tol)                                                                                         %1
                        fin = 1;                                                                                        %1
                        contador = contador + 2;
                    end

                    paso = paso+1;                                                                                          %2
                    contador = contador + 3;
                end
                % Metemos la última solución en un vector
    	        X=x(paso,:);                                                                                                %1
                contador = contador + 1;
            end
        end
    end
end