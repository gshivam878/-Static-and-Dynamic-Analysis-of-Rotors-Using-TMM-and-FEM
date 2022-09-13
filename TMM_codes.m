clear all
clc
syms('x')
syms T
%Given:
G = 0.8e11;
d = 0.01;
l_bd1= 0.05;
l_d1d2 = 0.075;
l = 1;
Ip1 = 0.08;
Ip2 = 0.2;

% Following properties we have:

j1 = (pi*d.^4)/32;
j2 = (pi*d.^4)/32;

k1 = G*j1/l_bd1;
k2 = G*j2/l_d1d2;

disp("Transfer_Matrix_Method:")

%r{s}2 = [P]2*[F]2*[P]1*[F]1*{s}0;
%t = [1-(nf^2*Ip1/k2) 1/k1(1-((nf^2*Ip1)/k2)); -nf^2*Ip2-nf^2*Ip1(-nf^2*Ip2/k2)+1 ((nf^4*Ip1*Ip2)/(k1*k2))-nf^4*(Ip1/k1+Ip2/k2+Ip3/k1)+1];

a = Ip1*Ip2;
b = Ip1*k2 + Ip2*k1 + Ip2*k2;
c = k1*k2;


nf1 = sqrt((b + sqrt((b)^2-(4*a*c)))/(2*a))
nf2 = sqrt((b - sqrt((b)^2-(4*a*c)))/(2*a))


disp("mode shape:")
phi11 = k2/(k1+k2-Ip1*nf1^2)
phi12 = k2/(k1+k2-Ip1*nf2^2)
phi2 = 1 % Because mode shapes are relative angular displacements of various discs in the rotor system
%phiz2 = 1/k1(1-((nf^2*Ip1)/k2) * T0


disp("we can get the torque:")

T0 = k2/((Ip1*k2 + Ip2*k1 - Ip1*Ip2*nf1^2)*nf1^2)
T0 = k2/((Ip1*k2 + Ip2*k1 - Ip1*Ip2*nf2^2)*nf2^2)
T1 = k2*(1-(T0/k1))

X = [0 0.08];
Y = [0 1];
plot(X,Y)

% X = [0 0.05 0.08];
% Y= [0 -5.68 1 ];
% plot(X,Y)



