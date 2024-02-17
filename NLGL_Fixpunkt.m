%**********************************************************
% Fixpunktiteration
%**********************************************************
clear; clc; close all;

% Gleichungssystem wird auf zwei verschiedene Wege nach x aufgelöst, sodass
% zwei Funktionen entstehen x = F(x) und x = G(x)

n = 10; %Anzahl der Schritte
%Vektoren für numerische Lösung erstellen
x = zeros(1,n + 1);
Fx = zeros(1,n + 1);
Gx = zeros(1,n + 1);
%Startwert setzen
x(1) = 1.25;



% mit F(x)
%----------------------------------------
for k = 1 : n + 1 
    %F(x) berechnen
    Fx(k) = exp(cos(x(k))); %<-------F(X) DEFINIEREN
    %x(k+1) = F(x(k)) setzen (außer beim letzten Schritt)
    if k <= n, x(k+1) = Fx(k); end;
end
k = 0 : 1 : n;
tab = [k' x' Fx'];
disp('Fixpunktiteration mit F(x)')
disp('k         x         F(x)');
disp(num2str(tab,'%10.5f')); disp(' ');

% mit G(x)
%---------------------------------------- 
for k = 1 : n + 1 
    %G(x) berechnen
    Gx(k) = acos(log(x(k))); %<-------G(X) DEFINIEREN
    %x(k+1) = G(x(k)) setzen (außer beim letzten Schritt)
    if k <= n, x(k+1) = Gx(k); end;
end
k = 0 : 1 : n;
tab = [k' x' Gx'];
disp('Fixpunktiteration mit G(x)')
disp(' k         x         G(x)');
disp(num2str(tab,'%10.5f')); disp(' ');

% Plot 
x = 0:1e-4:2;
y1 = exp(x.^3);
y2 = exp(x+1)-1/3;
plot(x,y1,x,y2);
axis([ 0, 2, 0, 1]);
grid on;