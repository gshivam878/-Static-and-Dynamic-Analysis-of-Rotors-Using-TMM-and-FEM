% FEM PROBLEM
clear all
clc
disp("The geared rotor system can be illustrated using FEM as follows-")

syms w
syms T
%Given:all are in standard units
da = 0.05;   %shaft A diameter
la = 0.75;   %shaft A length
db = 0.04;   %shaft B diameter
lb = 1.0;    %shaft B length
G = 0.8e11;  %modulus of rigidity of the shaft

%polar mass moments of inertia of discs and gears:
Ipa = 24;    
Ipga = 5;
Ipb = 10;
Ipgb = 3;

n=2

disp("boundary conditions:")
t1=0; 
t4=0; 

disp("As a result of the current rotor system, we can obtain the following data:")

Ja = pi*da^4/32
Jb = pi*db^4/32

ka = G*Ja/la
kb = G*Jb/lb

%interia_matrix:
Ip1 = [Ipa 0; 0 Ipga];
Ip2 = [Ipgb/n^2 0; 0 Ipb];

%displacement matrix:
i=ka, j=kb
k1 = [i -i; -i i]
k2 = [j/n^2 j/n; j/n j]

disp("Element_1")
I1 = [Ip1]; 
kt1 = k1;

disp("Element_2")
I2 = Ip2; 
kt2 = k2;

M = zeros(3,3);
M(1:2,1:2) = M(1:2,1:2) + I1;
M(2:3,2:3) = M(2:3,2:3) + I2

k = zeros(3,3);
k(1:2,1:2) = k(1:2,1:2) + kt1;
k(2:3,2:3) = k(2:3,2:3) + kt2

D = (inv(M)*k);
[u,v] =(eig(D))



y= [-0.6667   -0.6667    0.3333];
x= [0 1 1.75];
hold on
for i = 1:3
    plot(x,u(:,i));

end










