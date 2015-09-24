function x = backsub(U,d)

%% U os am uppser matrix we know
%% d is a set of values we know
%% x is a vector that is returned that we solve for 

n= size(d,1); %% Let 'n' be equal to the number of rows in d
x = zeros(n,1);

for  i = n:-1:1
   x(i) = d(i);
   
   for j = n : -1:i+1
      x(i) = x(i) - U(i,j) * x(j); 
   end    
   x(i) = x(i)/ U(i,i);
end    