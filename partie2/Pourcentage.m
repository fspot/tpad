function R = Pourcentage( A,B )
%Pourcentage 
    [lig,col]=size(A);
    R=zeros(col);
    for i=1:col
        for j=1:col
        R(j,i)=B(j,i)./A(1,i)*100;
        end
    end
end

