function [xhat]=E8Decoding(y)
%function decoding algorithm of E8 Lattices
%author: shanxianglyu@gmail.com

%query point y
%lattice point xhat
 
n=size(y,1);

xhat1=DnDecoding(y);

xhat2=DnDecoding(y-0.5*ones(n,1))+0.5*ones(n,1);

if norm(y-xhat1)<=norm(y-xhat2)
    xhat=xhat1;
else
    xhat=xhat2;
end


 