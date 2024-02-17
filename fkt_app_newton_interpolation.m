%**********************************************************
% Newtonsche Interpolationsformel
%**********************************************************

clear; clc; close all;


%**********************************************************
% 1. Setze die Stützpunkte für xi und yi ein
% 2. angezeigt wird das Steigungsschema
% 3. Phi wird dann direkt als Polynom angezeigt
% 4. Wenn Ausgabe in langen Brüchen, dann
% "sympref('FloatingPointOutput',true)" in Commandozeile eingeben und sich
% Phi nochnmal ausgeben lassen
%**********************************************************
%Stützpunkte n+1 --> es entsteht ein Polynom n-ten Grades
xi = [-20, -15, 0];
yi = [-22, -8, 25];

n = length(xi) - 1; %Grad des Polynoms = Anzahl der Stützstellen - 1

%Datenpunkte plotten
figure;
plot(xi,yi,'or');
Puffer_X = max(abs(xi))*0.1;
Puffer_Y = max(abs(yi))*0.1;
axis([min(xi)-Puffer_X, max(xi)+Puffer_X, min(yi)-Puffer_Y, max(yi)+Puffer_Y]);
hold on;

%Steigungsberechnung
newt = zeros(n); %Array für Steigungsberechnung
% 
% Berechung Steigungen erster Ordnung
for i = 1 : n
    newt(i,1) = (yi(i+1) - yi(i))/(xi(i+1) - xi(i));
end

%Berechnung Steigungen höherer Ordnung
for j = 2 : n
    %Steigung jter Ordnung
    for i = 1 : n+1-j
        newt(i,j) = (newt(i+1,j-1) - newt(i,j-1))/(xi(i+j) - xi(i));
    end
end
%Schema ausgeben
%--> Die am Ende benötigten Werte stehen in der ersten Zeile 
disp('Steigungsschema:');
disp(num2str(newt,'   %3.5f')); disp(' ');

%Polynom bilden und plotten
phi = yi(1);
syms x;
for j = 1:n
    koeff = newt(1, j);
    for i = 1:j
        koeff = koeff * (x - xi(i));
    end
    phi = phi +  koeff;
end

%disp(['phi = ', char(phi)]);
phi = simplify(phi); %Polynom vereinfachen
disp('vereinfachtes Interpolationspolynom:');
disp(['phi = ', char(phi)]);

%Polynom plotten
xp = min(xi) : 1e-2 : max(xi);
yp = subs(phi,xp);
plot(xp,yp);