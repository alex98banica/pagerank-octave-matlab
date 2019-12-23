% Banica Alexandru Ionut 311CB

function x=invMST (A)
  [n n]=size(A);
  x=zeros(n,n);
  for j=1:n
     x(j,j)=1/A(j,j);
     for i=j-1:-1:1
       x(i,j)=-A(i,i+1:j)*x(i+1:j,j)/A(i,i);
       end
       end
       end