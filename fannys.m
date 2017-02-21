clear all; close all;
n = 500; %nodes
dx = 10./(n-1); %timestep depending on no of nodes Delta X
X = 0:dx:10; %interval between T0...T5
%Derived analytical solution
Tanalytical = 0.00817*exp(X) + 19.991893*exp(-X) + 20;
Text = 20; %external temperature
K = zeros(n,n); %K depends on no of nodes

for i = 1:n
    for j = 1:n
        if i == j %diagonal
    K(i,j) =  2/dx + (2/3)*dx;
        elseif i == j+1 || i == j-1 % j+1, j-1 diagonal
    K(i,j) = -1/dx + dx/6;
        end
    end
end
%initialize b vector
%Linear system Kb = c
b = zeros(n,1);
for k = 2:n-1
    b(k) = Text*dx;
end
b(1) = Text*dx - 40*(-1/dx + dx/6); %dirchlet condition
b(end) = Text*dx -200*(-1/dx + dx/6); %with definition of T derived
c = zeros(n,1);
c = K\b; %c = inv(K)*b
Temp = zeros(1,n); %real temperature
for z = 2:n % z = 3....n
    Temp(z-1) = c(z); %Temp(2...n-1) = c(3:n)
end
Temp(1) = 40; %dirchlet conditions for boundary
Temp(end) = 200;

error = abs(Tanalytical - Temp); %error in numerical and analytical
avgError = sum(error)/length(error);
ufel = sqrt(dx^2*sum(error));
plot(X,Tanalytical, X, Temp); 
l = legend('Analytical','Numerical'); l.FontSize = 20;
axis([0 10 0 200]);
xlabel('Position of x [m]'); ylabel('Temperature [Celsius]')
figure()
plot(X,error, '*');
xlabel('Position of x [m]'); ylabel('Error in Temperature [Celsius]');