%**********************************************************
% Simpson
%**********************************************************
clear; clc; close all;
% Funktionsdefinition
syms x 
f = tanh(x)+exp(-x); % <--------FUNKTION EINGEBEN

% Intervalldefinition
a = -2;
b = 0;

%% Simpson Restgliedabschätzung
h = [1/2 1/4 1/6 1/8 1/10];

df = f;
for i = 1:4
    df = diff(df);
end
disp('4. Ableitung der Funktion ist:')
df

dfdoub = double(subs(df, x, a)) %<--------WERT FÜR RESTFEHLERABSCHÄTZUNG EINSETZTEN (WERT BEI DEM DER FEHLER POTENTIELL AM GRÖßTEN WIRD)
R = h.^4/180*dfdoub*(b-a)
disp('Restgliedabschätzung:');
disp('Schrittweite       Restglied');
disp(num2str([h' R'],'%15.7f    ')); disp(' '); % 15.7f gibt Stellen vor und hinter dem Komma an

%% Berechnen des Integrals
%Unterteilung in 6 Teilintervalle um Genauigkeit zu erreichen
h = 1/6; %<--------SCHRITTWEITE EINGEBEN    
x = -2 : h : 0; 
y = double(subs(f));

%Simpson-Formel anwenden
m = length(y) - 1;
I = y(1); %0tes Element
k = 4; %Koeffizient vor y-Werten
%Elemete 1 bis m-1
for i = 2:m
    I = I + k * y(i);
    k = 6 - k; %Wechsel zwischen 4 und 2
end
I = I + y(m+1); %(m+1)tes Element;
I = I * h/3;
%Ergebnis ausgeben
disp(['Ergebnis Simpson: I = ',num2str(I,'   %0.4f')]); disp(' ');


figure;
plot(x,y);
axis([a, b, min(y), max(y)]);