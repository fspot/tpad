function R = CalcMinFs( A,B )
%CalcMinFs 
    [lig,col]=size(A);
    R=zeros(1,lig);
    S=A*B';
    for i=1:lig
       R(1,i)=S(i,i); 
    end
end

