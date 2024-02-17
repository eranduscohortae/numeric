%**********************************************************
% Heun-Verfahren
%**********************************************************
clear; clc; close all;

f = @(y) -1/4*y;

m = 1; %<-------ANZAHL DER KORREKTORITERATIONEN
h = 1.5; %<------SCHRITTWEITE
n = 2; %<------ANZAHL DER INTEGRATIONSSCHRITTE

%Vektor für numerische Lösung erstellen
y = zeros(1,n+1);

%Startwert setzen
y(1) = 1;%<------STARTWERT

NL_log = zeros(n+1,1+m);
NL_log(1,1) = y(1); 

for k = 1 : n
    %Prädiktor
    y(k+1) =  y(k) + h * f(y(k)); %<-------FUNKTION y'= f(x,y) expliziter Euler
    NL_log(k+1,1) = y(k+1); %Prädiktor protokollieren   
    %Korrketor
    for i = 1 : m
        y(k+1) = y(k) + h/2*(f(y((k+1)))+f(y(k)));%<-------FUNKTION
        NL_log(k+1,1+i) = y(k+1); %Korrektorschritt protokollieren
    end
end
x = 0:h:3;
 plot(x,y,'r');
NL_log = [x' NL_log]; %x und analytische Lösung an Log anhängen
disp('Heun-Verfahren')
disp('x          yp         yk1        yk2        yk3');
disp(num2str(NL_log,'%8.5f   ')); disp(' ');