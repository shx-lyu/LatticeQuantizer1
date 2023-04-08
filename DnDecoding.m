function [xhat]=DnDecoding(y)
%function decoding algorithm of Dn Lattices
%author: shanxianglyu@gmail.com

%query point y
%coefficient shat, lattice point xhat

%n=size(D,2);
%define f
f=round(y);
delta=abs(y-f);
k=find(delta==max(delta));
%define g
g=f;
    if f(k)<=y(k)
        g(k)=f(k)+1;
    else
        g(k)=f(k)-1;
    end
%estimate lattice point xhat
if mod(sum(f),2)==0
    xhat=f;
else
    xhat=g;
end


 