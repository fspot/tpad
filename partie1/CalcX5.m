function [  ] = CalcX5( f, Mf, Pf )

x=zeros(100,1);
y=zeros(1,100);
y1=zeros(1,100);
y2=zeros(1,100);

f33=[8 1 11 0 10 25];
f35=[5 0 0 0 10 25];
for i=1:100
    Pf(1,11)=((10000/100)*i)*(-1);
    x(i,1)=Pf(1,11);
    
    X=linprog(f,Mf,Pf,[],[],zeros(12,1))
    y1(1,i)=f33*X;
    y2(1,i)=f35*X;
    y(1,i)=f*X;
end
x=-x;
hold on
plot(x,y,'g-*')
plot(x,y1,'r-*')
plot(x,y2,'b-*')
