function [ x,y ] = CalcX3( Mf, Pf )

x=zeros(100,1);
y=zeros(1,100);

f3=[ 5 5 6 8 5 4]; 


for i=1:100
    Pf(1,11)=((10000/100)*i)*(-1);
    x(i,1)=Pf(1,11);
    
    X=linprog(f3,Mf,Pf,[],[],zeros(6,1))
    y(1,i)=f3*X;
end
x=-x;

plot(x,y,'g-*')
