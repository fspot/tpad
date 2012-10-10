function [ ] = CalcX4( f, Mf, Pf )

x=zeros(100,1);
y1=zeros(1,100);
y2=zeros(1,100);

for i=1:100
    Pf(1,11)=(1)*(i);
    Pf(1,12)=-Pf(1,11);
    x(i,1)=Pf(1,11);
    X1=linprog(f,Mf,Pf,[],[],zeros(12,1));
    Pf(1,11)=-Pf(1,11);
    Pf(1,12)=-Pf(1,12);
    X2=linprog(f,Mf,Pf,[],[],zeros(12,1));
    y1(1,i)=f*X1;
    y2(1,i)=f*X2;
end

plot(x,y1,'g-*')
hold on
plot(x,y2,'r-*')
