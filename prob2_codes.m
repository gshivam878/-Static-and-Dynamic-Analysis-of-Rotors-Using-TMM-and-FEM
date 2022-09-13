% FEM PROBLEM
clear all
clc
disp("The branched geared rotor system can be illustrated using FEM as follows-")

syms w
syms T
%Given:all are in standard units

%d_ab = 0.4;                 %shaft AB diameter
%d_ce = 0.2;                 %shaft CE diameter
%d_df = 0.1;                 %shaft DF diameter

d = [0.03 0.02 0.02];

%l_ab = l_ce = l_df = 0.25;  %Length of shaft AB, CE, DF

l = 0.25;
G = 0.8e11;                 %modulus of rigidity of the shaft

%polar mass moments of inertia of discs and gears:
Ipa = 0.01; 
Ipb = 0.005;
Ipe = 0.005;
Ipf = 0.006; 
Ipc = 0.006;
Ipd = 0.006;


n_bc = 3;
n_bd = 4;


disp("From the free boundary conditions at shaft ends A, E, and F:")
%Ta =Te =Tf = 0; 

disp("As a result of the current rotor system, we can obtain the following data:")

for i=0
    j = (pi*d.^4)/32;
end

for p=0
    k = G*j/l;
end


%interia_matrix:
Ip1 = [Ipa 0; 0 Ipb];
Ip2 = [Ipc/n_bc^2 0; 0 Ipe];
Ip3 = [Ipd/n_bd^2 0; 0 Ipf];

%Stiffness Matrix:

kt1 = [k(1,1) -k(1,1); -k(1,1) k(1,1)];
 
kt2 = [k(1,2)/n_bc^2 k(1,2)/n_bc; k(1,2)/n_bc k(1,2)];

kt3 = [k(1,3)/n_bd^2 k(1,3)/n_bd; k(1,3)/n_bd k(1,3)];



M = zeros(4,4);

M(1:2,1:2) = M(1:2,1:2) + Ip1;
M(2:3,2:3) = M(2:3,2:3) + Ip2;
M([2 4], [2 4]) =M([2 4], [2 4]) + Ip3


k = zeros(4,4);
k(1:2,1:2) = k(1:2,1:2) + kt1;
k(2:3,2:3) = k(2:3,2:3) + kt2;
k([2 4], [2 4]) =k([2 4], [2 4]) + kt3


D = (inv(M)*k);
[u,v] =(eig(D))

x= [0 0.25 0.5 1.0];
hold on
for i = 1:4
    plot(x,u(:,i));

end










