function [ F ] = Calc_f1( M, V, PM)
%Calcul du vecteur fonction sur le b�n�fice sur chaque type de produit
%M repr�sente la matrice de contraintes
%V repr�sente les pris de ventes par type de produit
%PM repr�sente les valeurs limites vers lesquelles ont veut se rapprocher


	cte = [2 2 1 1 2 3 1]; %co�t horaire des diff�rentes matrices
	F = zeros(1,6);

	%Calcul du cout d'utilisation par machine 
	for j=1:7
		for i=1:6
			F(i)= F(i) +M(j,i)*cte(j)/60;
		end
	end
	
	%Ajout du prix sur les mati�res premi�res
	for i=1:6
		PM(1)*M(8,i) + PM(2)*M(9,i) + PM(3)*M(10,i)
		F(i)=F(i) + PM(1)*M(8,i) + PM(2)*M(9,i) + PM(3)*M(10,i);
	end
	
	%Retrait du prix de vente de chaque type de produit
	%(resultat = valeur n�gative afin de maximiser le b�n�fice)
	for i= 1:6
		F(i) = F(i)-V(i);
	end
end

