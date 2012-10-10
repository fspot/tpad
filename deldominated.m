function [ res, keeped ] = deldominated( mat )
%DELDOMINATED Summary of this function goes here
%   Detailed explanation goes here
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

