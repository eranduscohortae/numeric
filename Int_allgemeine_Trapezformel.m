%**********************************************************
% Verallgemeinerte Trapezmethode
%**********************************************************

clear; clc; close all;


%Integrationsgrenzen
a = 0;% <--------INTERVALLGRENZE EINGEBEN
b = 1;% <--------INTERVALLGRENZE EINGEBEN

% Funktionsdefinition
syms x 
f = exp(-x^2); % <--------FUNKTION EINGEBEN

%% Trapezformel Restgliedabschätzung
h = [1/2 1/4 1/6 1/8 1/10];

df = f;
for i = 1:2
    df = diff(df);
end
disp('2. Ableitung der Funktion ist:')
df

dfdoub = double(subs(df, x, b)) %<--------WERT FÜR RESTFEHLERABSCHÄTZUNG EINSETZTEN (WERT BEI DEM DER FEHLER POTENTIELL AM GRÖßTEN WIRD)
R = h.^2/12*dfdoub*(b-a)
disp('Restgliedabschätzung:');
disp('Schrittweite       Restglied');
disp(num2str([h' R'],'%15.7f    ')); disp(' '); % 15.7f gibt Stellen vor und hinter dem Komma an

%#### gegebene Funktion ####
% Stützpunkte --> a : h : b
xi = 5e-4 : 5e-4 :  1;
% Funktionsdefinition
yi = (1 - xi).^(1/3) ./ sqrt(sin(exp(xi) - 1));

%#### gegebene Stützpunkte
%xi = [1,2,3]
%yi = [1,5,2]

% Plotten der Funktion
figure;
plot(xi,yi);
axis([min(xi), max(xi), min(yi), max(yi)]);

% Definition des Integralwertes
I = 0;
% Anzahl der Stützstellen m+1
m = length(xi) - 1;
for i = 1:m
    h = (xi(i+1)-xi(i));
    I =  I + h/2*(yi(i)+yi(i+1)); % auf diese weise Addieren wir x1 und x{m+1} nur einmal und alle anderen xi zweimal auf
end
disp('f(x_i) (beginnend bei i=0):')
disp(yi); disp(' ');
disp(['Ergebnis verallg. Trapezmethode: I = ',num2str(I,'   %0.5f')]);
disp(' ');
