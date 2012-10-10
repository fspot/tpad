function S = electre1( MatJug, s, v )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    [ MatJug, indices ] = deldominated(MatJug);
    [C,D] = calcCD(MatJug);
    R = seuil(C,D,s,v);
    
    S = R.*indices;
    S = S(find(S~=0));
end

