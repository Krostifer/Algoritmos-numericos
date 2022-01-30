function createfigureComparacionCurvasP9(YMatrix1)
%CREATEFIGURE(YMatrix1)
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 25-Jan-2022 03:53:57

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(YMatrix1);
set(plot1(1),'DisplayName','Curva ajustada');
set(plot1(2),'DisplayName','Aproximación grado 9');

% Create title
title({'Comparación curva ajustada vs Aproximación polinomio grado 9'});

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0 700]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[-10000 25000]);
box(axes1,'on');
hold(axes1,'off');

% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.165277780059518 0.851832820438857 0.0911458314086001 0.0375128458852269]);
