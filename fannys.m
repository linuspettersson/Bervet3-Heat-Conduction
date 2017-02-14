clear all;
%analytical
xana = 0:0.1:10;
Tana = 0.00817*exp(xana) + 19.991893*exp(-xana) + 20;
%plot(xana,Tana);
%numerical
N = [5,10,40,80,160,500];
dx = 10./N;
x = 0:N:10;
K = zeros(length(N),length(N));
for i=1:length(N);
    for j =1:length(N)
        if(i ==j)
            K(i,j) = 2/dx(1) + dx(1)/6;
            
        %elseif(i == j+1 || i == j-1)
     %       K(i,j) = -1/dx + dx/6;
        end
     %K(1:i-1,1) = 2/dx + (2/3)*dx;
    end
end
%b = length(K);
Text = 20;
b = zeros(size(K,1),1);
b(:) = Text*dx;
b(1) = Text*dx + 40/dx - (40*dx)/6;
b(end) = 20*dx + 200/dx - (200*dx)/6;
c = zeros(size(K,1),1);
c = K\b;
Tans = zeros(size(K,1),1);
for i = 1:N-1
   Tans(i+1) = c(i); 
end
Tans(1) = 40;
Tans(end) = 200;