clear; clc;
close all;

%%auch Diskrete Approximation im Mittel

%Datenstützpunkte m+1
xi = [-2 0 1 3];
yi = [-29 -3 1 21];

%Datenpunkte plotten
figure;
plot(xi,yi,'ob');
Puffer_X = max(abs(xi))*0.1;
Puffer_Y = max(abs(yi))*0.1;
axis([min(xi)-Puffer_X, max(xi)+Puffer_X, min(yi)-Puffer_Y, max(yi)+Puffer_Y]);
hold on;

% gewünschter Grad des Polynoms
n = 1;

%Matrix und Vektor für GLS aufstellen --> Aufstellen des Gleichungssystems
%%% A enthält auf den Diagonalen (von links unten nach rechts oben) die
%%% Summen von x^i beginnend mit A11 = Summe aus x^0 (Anzahl der Stützstellen), dann A21 und A12 = Summe aus x^3, usw.  
A = zeros(n+1);
for i = 1:n+1
    for j = 1:n+1
        A(i,j) = sum(xi.^(i+j-2));
    end
end
disp('x-Summen-Matrix (linke Seite):')
disp(A); disp(' ');

%%% ys enthhält von oben nach unten die Summe von y*xi beginnend mit i = 0
%%% (also erster Eintrag ist nur Summe von Y)
ys = zeros(n+1,1);
for i = 1:n+1
    ys(i) = sum(yi.*xi.^(i-1));
end
disp('yx-Summen-Vektor (rechte Seite):');
disp(ys); disp(' ');

%Koeffizientenberechnung
%%% Löst das Gleichungssystem
a = A\ys;
disp('Koeffizienten:');
disp(a); disp(' ');

%Polynom bilden
phi = 0;
syms x;
for i = 1:n+1
    phi = phi + a(i)*x^(i-1);
end

phi = simplify(phi);
disp('Approximationspolynom:');
disp(['phi = ', char(phi)]);
xp = -3 : 1e-3 : 4;
yp = subs(phi,xp);
plot(xp,yp);
