function S = electre1( MatJug, s, v )
%implémentation de l'algorithme de choix alpha Electre 1

    [ MatJug, indices ] = deldominated(MatJug);
    [C,D] = calcCD(MatJug);
    R = seuil(C,D,s,v);
    
    S = R.*indices;
    S = S(find(S~=0));
end

