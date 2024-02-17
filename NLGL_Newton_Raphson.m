%**********************************************************
% Newton-Raphson 1D
%**********************************************************
clear; clc; close all;
%%
% Plot 
x = 0:1e-4:2;
y1 = exp(x.^3);
y2 = exp(x+1)-1/3;
plot(x,y1,x,y2);
axis([ 0, 2, 0, 1]);
grid on;
%%

% Funktionsdefinition
syms x
f = exp(x+1)-1/3-exp(x.^3)

df = diff(f)

%Verfahrensparameter

n = 10; %<-----ANZAHL DER ITERATIONSSCHRITTE

xi = zeros(1,10);
xi(1) = 1.3; %<-----STARTWERT

for i = 1:n
    xi(i+1) = xi(i)-(double(subs(f, x, xi(i)))/double(subs(df, x, xi(i))));
end

k = 0 : 1 : n;
tab = [k' xi'];
disp('Newton-Raphson-Verfahren')
disp('k         x');
disp(num2str(tab,'%10.5f')); disp(' ');

x = xi-0.5*xi : (0.5*xi)/10 : xi+0.5*xi ;
y = double(subs(f));

figure;
plot(x,y);
axis([min(x), max(x), min(y), max(y)]);
grid on;