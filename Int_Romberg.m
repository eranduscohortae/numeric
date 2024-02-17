%**********************************************************
% Romberg-Algorithmus
%**********************************************************

clear; clc; close all;

%Integrationsgrenzen
a = -2;% <--------INTERVALLGRENZE EINGEBEN
b = 0;% <--------INTERVALLGRENZE EINGEBEN

% Funktionsdefinition
syms x 
f = tanh(x)+exp(-x); % <--------FUNKTION EINGEBEN

%% Trapezformel Restgliedabschätzung
h = [1/2 1/4 1/6 1/8 1/10 1/20 1/100];

df = f;
for i = 1:2
    df = diff(df);
end
disp('2. Ableitung der Funktion ist:')
df

dfdoub = double(subs(df, x, a)); %<--------WERT FÜR RESTFEHLERABSCHÄTZUNG EINSETZTEN (WERT BEI DEM DER FEHLER POTENTIELL AM GRÖßTEN WIRD)
R = h.^2/12*dfdoub*(b-a);
disp('Restgliedabschätzung:');
disp('Schrittweite       Restglied');
disp(num2str([h' R'],'%15.7f    ')); disp(' '); % 15.7f gibt Stellen vor und hinter dem Komma an


%% Wenn f(x) gegeben
n = 7; %bis zu welchen T_nn rechnen? % <--------SCHRITTANZAHL EINGEBEN

T = zeros(n+1); %Array für Tji

%Tj0 berechnen nach verallgemeinerter Trapezregel
for j = 0 : n
    x = a : (b-a)/2^j : b; %ändert die Schrittweite für die ersten T-Werte (immer die Hälfte vom Vorgänger)
    y = tanh(x)+exp(-x); % <--------FUNKTION EINGEBEN
    I = 0;
    % Allgemeine Trapezformel
    for i = 1 : 2^j
        I = I + (x(i+1)-x(i))/2*(y(i)+y(i+1));
    end;
    T(j+1,1) = I;
end

%Tji berechnen
for j = 1 : n
    for k = 1 : j
        T(j+1,k+1) = (4^k*T(j+1,k)-T(j,k))/(4^k-1);
    end
end

disp('Rombergschema:')
disp(num2str(T,'   %0.4f')); disp(' ');

I = T(n+1,n+1);
disp(['Ergebnis Romberg: I = ',num2str(I,'   %0.5f')]); disp(' ');

figure;
plot(x,y);
axis([a, b, min(y), max(y)]);

%% Wenn nur Stützstellen gegeben
% ungerade Anzahl an Stützstellen benötigt
xi = 0: 0.25 : 1;
yi = [cosh(0) cosh(0.25) cosh(0.5) cosh(0.75) cosh(1)];