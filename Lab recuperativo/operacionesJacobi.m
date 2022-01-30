% Función que resuelve un sistema lineal por el metodo iterativo de Jacobi.
function [X, operaciones]=Jacobi(A, b, x0, iter, tol )
    if nargin < 5
        error('Faltan argumentos de entrada')
        return;
    else
        [cols, filas]=size(A);
        operaciones = 6 + 1 + cols + filas;
        if cols~=filas
            error('La matriz no es cuadrada') 
            return;
        else
            if (cols~=size(x0)) | (cols~=size(b))
                error('El sistema no es valido');
            else
                % Generamos las matrices D, L y R
                operaciones = operaciones + 1 + 12 + 2; 
                for k=1:cols
                    for j=k+1:cols
                        if k~=j
                            D(j,k)=0;
                            D(k,j)=0;
                            L(j,k)=A(j,k);
                            L(k,j)=0;
                            R(k,j)=A(k,j);
                            R(j,k)=0;
                            operaciones = operaciones + 6;
                        end
                    end
                    D(k,k)=A(k,k);
                    L(k,k)=0;
                    R(k,k)=0;
                    operaciones = operaciones + 3;
                end
                fin=0;
                paso=1;
                x(1,:)=x0';
                operaciones = operaciones + 3 + 6;

                % La condicion de parada adicional es que se llegue a la solución exacta
                while (fin==0) && (paso<=iter)
                    for componente=1:cols
                        vectant=0;
                        vectsig=0;
                        operaciones = operaciones + 2;
                        for k=1:componente-1
                            vectant=vectant+A(componente,k)*x(paso,k);
                            operaciones = operaciones + 3;
                        end
                        for k=componente+1:cols
                            vectsig=vectsig+A(componente,k)*x(paso,k);
                            operaciones = operaciones + 3;
                        end
                        x(paso+1,componente) = (b(componente)-vectant - vectsig)/A(componente,componente);
                        operaciones = operaciones + 5;
                    end
                    
                    % Si la solucion es igual a la anterior, salimos del bucle
                    if x(paso,:)==x(paso+1,:)
                        fin=1;
                    end
                    operaciones = operaciones + 1;
                    %Calculamos el eror
                    error = norm(x(paso+1,:) - x(paso,:));
                    operaciones = operaciones + 6 + size(x, 2);

                    %Si el error es menor a la tolerancia, salimos del bucle
                    if(error < tol)
                        fin = 1;
                    end

                    paso = paso+1;
                    operaciones = operaciones + 3;
                end
                % Metemos la última solución en un vector
    	        X=x(paso,:);
                operaciones = operaciones + size(x, 2);
            end
        end
    end
end