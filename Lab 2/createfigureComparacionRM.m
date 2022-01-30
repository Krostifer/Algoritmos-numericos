function createfigureComparacionRM(YMatrix1)
%CREATEFIGURE(YMatrix1)
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 17-Jan-2022 03:16:18

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','Datos originales');
set(plot1(2),'DisplayName','Spline');
set(plot1(3),'DisplayName','Lineal');
set(plot1(4),'DisplayName','Pchip');

% Create ylabel
ylabel('Casos');

% Create xlabel
xlabel('Días');

% Create title
title('Datos originales vs Interpolaciones para RM');

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'YGrid','on');
% Create legend
legend(axes1,'show');
