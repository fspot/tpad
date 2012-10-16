 function S = electre1( MatJug, s, v )
%implémentation de l'algorithme de choix alpha Electre 1

    [ MatJug, indices ] = deldominated(MatJug);
    [C,D] = calcCD(MatJug);
    R = seuil(C,D,s,v);
    
    S = R.*indices;
    S = S(find(S~=0));
end



function [ res, keeped ] = deldominated( mat )
%permet d'éliminer les solutions dominées

    [h,w] = size(mat);
    res = [];    % lignes non dominees (matrice)
    keeped = []; % liste des indices des lignes non dominees.
    for i=1:h,
        vi = mat(i,:);
        dominee = 0;
        for j=1:h,
            if i ~= j,
                vj = mat(j,:);
                if max(vi-vj) <= 0,
                    if min(vi-vj) < 0 || i<j,
                        dominee = 1;
                    end
                end
            end
        end
        if dominee == 0,
            res = [res;vi];
            keeped = [keeped,i];
        end
    end
end



function [ C,D ] = calcCD( MatJugements )
%calcule les matrices de concordance / discordance pour Electre 1
    
    [lignes,col] = size(MatJugements);
    C = zeros(lignes);
    D = zeros(lignes);
    
    for i=1:lignes,
        for j=1:lignes,
            if (i~=j),
                for k=1:col,
                    if (MatJugements(i,k) >= MatJugements(j,k)),
                        C(i,j) = C(i,j) + 1; %coefs identiques
                    end
                    if (MatJugements(i,k) < MatJugements(j,k)),
                        D(i,j) = max( D(i,j), MatJugements(j,k) - MatJugements(i,k) );
                    end
                end
            end
        end
    end
    
    C = C * (1/col);
    D = D * (1/10); %toutes les échelles 0->10

end



function R = seuil( C,D,s,v )
%renvoie la liste des solutions respectant les seuils de concordance (s) / discordance 

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


