function [v_final]=L16Decoding(y)

%function decoding algorithm of Lambda16
%author: lsx07@jnu.edu.cn

%query point y
%RETURN: closest vector to y: v_final

 G1=[1     1     1     1     1     1     1     1     0     0     0     0     0     0     0     0
     1     1     1     1     0     0     0     0     1     1     1     1     0     0     0     0
     1     1     0     0     1     1     0     0     1     1     0     0     1     1     0     0
     1     0     1     0     1     0     1     0     1     0     1     0     1     0     1     0
     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1]';
 
 n=16;
%Comparing the coset representatives
 for k=1:32
     %decoding for each 2D2+dk
     d(1:n,k)=G1*(de2bi(k-1,5)'); %G1 times a binary vector of 5 dimensions
     %y=2D_{16}*x + dk + n;
     ybar=(y-d(1:n,k))/2;
     vhat(1:n,k)=2*DnDecoding(ybar)+d(1:n,k);%32 possible closest vectors
     Dist(k)=norm(y-vhat(1:n,k));
 end
  
 v_final = vhat(1:n,find(Dist==min(Dist)));
 

 