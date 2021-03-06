function createfigureTiempos(YMatrix1)
%CREATEFIGURE(YMatrix1)
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 19-Dec-2021 19:39:51

% Create figure
figure1 = figure('Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(YMatrix1,'LineWidth',1.5,'Parent',axes1);
set(plot1(1),'DisplayName','Método Crout');
set(plot1(2),'DisplayName','Método Jacobi');
set(plot1(3),'DisplayName','Método Gram-Schmidt');

% The following line demonstrates an alternative way to create a data tip.
% datatip(plot1(2),3,9.2143565);
% Create datatip
datatip(plot1(2),'DataIndex',3);

% Create ylabel
ylabel({'Tiempo[s]'});

% Create xlabel
xlabel({'Iteración'});

% Create title
title({'Costos temporales en segundos para los métodos'});

hold(axes1,'off');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.765040299943834 0.811165792323426 0.19523268603169 0.126190472784496]);

