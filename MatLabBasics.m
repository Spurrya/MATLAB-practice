clear all;
close all; 
clc; %% clear the command window


n = 5;

%% We can define a vector 'n' x 1 vector of zeros;

A = zeros(n,1);

%% We can define a vector 1 x 'n' vector of zeros
A = zeros(1,n);

%% We can define a vector of n x 1 of ones

A = ones(n,1)

%% Let us define a 5 x 5 matrix called A of zeros

A = zeros(n) %% This show this is a square matrix

%% We can define 'm' x 'n' matrices
m = 4;
A = zeros(m,n);

%% We can also specify values into a matrix

A = [8 -1 -1 -2 -4;
    -1 9 -3 0 -5;
    -1 -3 10 -2 -4;
    -2 0 -2 5 -1;
    -4 -5 -4 -1 14;]; 

display(A(2,2)); %% This should present the value 9

%% Let us say we want to look at all the values in line 1 and 3

display(A([1,3],:))

display(A)

%%A([2,3,4,5],:) = A ([4,5,2,3], :); %% This swaps rows 2 and 3 with rows 4 and 5 respectively
                                    


A([2:5],:) = A([4,5,2,3],:); %%This is the same as above but more compact


%% We want to swap columns

A(:,[2:5]) = A(:, [4,5,2,3]);
display(A);

%% We are going to make smaller sub matrices

Ke = A([1:3],[1:3]);
Kef= A([1:3],[4:5]);
Kfe = A([4:5],[1:3]);
Kf = A([4:5],[4:5]);

%% Let us define our B- vector
B = [0;0;0;0;0];
B = zeros(n,1);

B(2) = 0;
B(3) = 5;

B([2:5]) = B([4,5,2,3]);

Be = B([1:3]);
Bf = B([4:5]);

%% Let us solve for the unknown values in x
x = 6556 * ones(n,1); %% Multiply with a large number to identify garbage numbers

x(1) = 0;
x(4) = 1/2;
x(5) = 1;

x([2:5]) = x([4,5,2,3])

xe = x([1:3])
xf = x([4:5])

%% Let us define the RHS

RHS = Bf - Kfe*xe

Kfinv = inv(Kf) %% Simple inversion vector

xf = Kfinv* RHS

x([4:5]) = xf%% This substitutes the values you just solved back into the soln vector

B = A*x


%% Let us see what happens when the system of equations are not linearly independent

C = [1 -1;
    -1 1;];

% inv(C)
% det(C)

%%% We want to take the transpose 

transpose(A);
A';



[L,U] = lu(Kf)

%% We are trying to solve [L][U} [x] = [b]
%% Once we have our [L] , [U] ,we need

n=5; % n is the total number of equations
m=3; % m is the number of values that we know


xf = zeros(n-m,1);
d = zeros(n-m,1)

%% Forward substitution algorithm
for i=1:(n-m)
   d(i) = RHS(i);
   
   for j=1: (i-1)
       d(i) = d(i) - L(i,j) * d(j);
   end    
   d(i) = d(i) / L(i,i)

end

xf = backsub(U,d)