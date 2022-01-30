function createfigureAcumulados(YMatrix1)
%CREATEFIGURE(YMatrix1)
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 17-Jan-2022 02:56:02

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','Arica y Parinacota');
set(plot1(2),'DisplayName','Tarapacá');
set(plot1(3),'DisplayName','Antofagasta');
set(plot1(4),'DisplayName','Atacama');
set(plot1(5),'DisplayName','Coquimbo');
set(plot1(6),'DisplayName','Valparaíso');
set(plot1(7),'DisplayName','Metropolitana');
set(plot1(8),'DisplayName','O''Higgins');
set(plot1(9),'DisplayName','Maule');
set(plot1(10),'DisplayName','Ñuble');
set(plot1(11),'DisplayName','Biobío');
set(plot1(12),'DisplayName','Araucanía');
set(plot1(13),'DisplayName','Los Ríos');
set(plot1(14),'DisplayName','Los Lagos');
set(plot1(15),'DisplayName','Aysén');
set(plot1(16),'DisplayName','Magallanes');
set(plot1(17),'DisplayName','Total diario');

% Create ylabel
ylabel('Casos');

% Create xlabel
xlabel('Días');

% Create title
title('Casos confirmados acumulativos por regiones');

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'YGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.0233506962838061 0.635491615045802 0.0776041651455064 0.291880772758241]);

