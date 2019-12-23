% Banica Alexandru Ionut 311CB

function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
	in=fopen(nume,'r');
  n=fscanf(in,"%d",1);
    for k=1:n
    i=fscanf(in,"%d",1);
    t=fscanf(in,"%d",1);
      for h=1:t
          j=fscanf(in,"%d",1);
      endfor
      endfor
  val1=fscanf(in,"%f",1);
  val2=fscanf(in,"%f",1);
  R1=zeros(n,1);
  R2=zeros(n,1);
    fclose(in);
  R1=Iterative(nume,0.85,0.001);
  R2=Algebraic(nume,0.85,0.001);
  v=zeros(n,2);
  for i=1:n   
   v(i,2)=R2(i,1);
  v(i,1)=i;
  endfor
   
    for i=1:n-1
     for j=(i+1):n
        if( v(i,2)<v(j,2) )
          aux=v(i,2);
          v(i,2)=v(j,2);
          v(j,2)=aux;
          aux=v(i,1);
          v(i,1)=v(j,1);
          v(j,1)=aux;
          endif
          if ( v(i,2) ==v(j,2) )
          aux=v(i,1);
          v(i,1)=v(j,1);
          v(j,1)=aux;
          disp(i);
          endif
          endfor
          endfor
      
       for i=1:n
         v(i,2)=Apartenenta(v(i,2),val1,val2);
         endfor
          
    fisier=strcat(nume,'.out');
    	out=fopen(fisier,'w');
      fprintf(out,"%d\n",n);
     for i=1:n
        fprintf(out,"%f\n",R1(i,1));
        endfor
       fprintf(out,"\n");
      for i=1:n
        fprintf(out,"%f\n",R2(i,1));
        endfor
       fprintf(out,"\n");
      for i=1:n
        fprintf(out,"%d %d %f\n",i,v(i,1),v(i,2));
        endfor

     fclose(out);
  endfunction