%**********************************************************
% einfache Interpolatorische Quadraturformneln
%**********************************************************
clear; clc; close all;

% Funktionsdefinition
syms x 
f = exp(-(x+0.5)^2); % <--------FUNKTION EINGEBEN für Teschebyscheff und Gauß Verschiebung beachten!!

% Schrittweite für Tschebyscheff/Gauß
h = 0.5;

% Stützstellen für Newton-Cotes

xn = 0 : 1 : 1;

% Anzahl der Stützstellen
m = 3;

if m == 1
    disp('Tschebyscheff/Gauß');
    x = 0;
    disp('Funktionswert:');
    y = double(subs(f))
    disp('Integrationswert:');
    I = 2*h*y
elseif m == 2 
    % Tschebyscheff/ Gauß
    disp('Tschebyscheff/Gauß');
    x = [-(h/3)*sqrt(3), (h/3)*sqrt(3)];
    disp('Funktionswerte:');
    y = double(subs(f))
    disp('Integrationswert:');
    I = h*(y(1)+y(2))
    
    % Newton-Cotes
    disp('Newton-Cotes');
    x = xn;
    disp('Funktionswerte:');
    y = double(subs(f))
    disp('Integrationswert:');
    I = (h/2)*(y(1)+y(2))
    
elseif m == 3
    % Tschebyscheff
    disp('Tschebyscheff');
    x = [-(h/2)*sqrt(2), 0, (h/2)*sqrt(2)];
    disp('Funktionswerte:');
    y = double(subs(f))
    disp('Integrationswert:');
    I = (2*h/3)*(y(1)+y(2)+y(3))
    % Gauß
    disp('Gauß');
    x = [-(h/5)*sqrt(15), 0, (h/5)*sqrt(15)];
    disp('Funktionswerte:');
    y = double(subs(f))
    disp('Integrationswert:');
    I = (h/9)*(5*y(1)+8*y(2)+5*y(3))
    % Newton-Cotes
    disp('Newton-Cotes');
    x = xn;
    disp('Funktionswerte:');
    y = double(subs(f))
    disp('Integrationswert:');
    I = (h/3)*(y(1)+4*y(2)+y(3))
end