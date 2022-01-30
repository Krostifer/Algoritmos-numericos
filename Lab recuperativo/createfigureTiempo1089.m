function createfigureTiempo1089(yvector1)
%CREATEFIGURE(yvector1)
%  YVECTOR1:  bar yvector

%  Auto-generated by MATLAB on 26-Jan-2022 00:27:57

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create bar
bar(yvector1);

% Create ylabel
ylabel({'Segundos'});

% Create title
title({'Costo temporal matriz 1089x1089'});

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(gca,'xtick',1:6);
set(gca,'xticklabel', {'LU' 'Cholesky' 'QR' 'Jacobi' 'Jacobi-Seidel' 'SOR'});