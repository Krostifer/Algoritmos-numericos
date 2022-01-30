function createfigureDiario(YMatrix1)
%CREATEFIGURE(YMatrix1)
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 17-Jan-2022 02:59:00

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
title('Casos diarios por regiones');

box(axes1,'on');
hold(axes1,'off');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.0111111131910647 0.626241871983109 0.0963541645867125 0.291880772758241]);
