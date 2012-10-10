function R = seuil( C,D,s,v )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [nbsol,trash] = size(C);

    R = ones(1,nbsol);
    for col=1:nbsol,
        valide = 1;
        ligne = 1;
        while (valide==1) && (ligne <= nbsol)
            if (ligne~=col)
                if ( C(ligne,col)>s && D(ligne,col)<v )
                    valide = 0;
                    R(col) = 0;
                end
            end 
            ligne = ligne + 1;
        end
    end
end


