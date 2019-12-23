% Banica Alexandru Ionut 311CB
function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
    
    R=inv( eye(n) - d*M)* (1-d)/n*ones(n,1);
      fclose(in);
   endfunction