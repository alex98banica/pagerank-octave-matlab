% Banica Alexandru Ionut 311CB

function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  in=fopen(nume,'r');
  n=fscanf(in,"%d",1);
  A=zeros(n);
  K=zeros(n);
  for k=1:n
    i=fscanf(in,"%d",1);
    t=fscanf(in,"%d",1);
      for h=1:t
          j=fscanf(in,"%d",1);
          if(i!=j)
          K(i,i)++;
           A(i,j)=1;
            endif
      end
  end
  M=(GramSchmidt(K)*A)'; 
  R=zeros(n,1);
  R=1/n*ones(n,1);
  R1=d*M*R+(1-d)/n*ones(n,1);
 
 while  norm(R - R1) >= eps
   R=R1;
   R1=d*M*R+(1-d)/n*ones(n,1);
 endwhile   
 
  fclose(in);
endfunction