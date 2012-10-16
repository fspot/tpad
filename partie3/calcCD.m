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

