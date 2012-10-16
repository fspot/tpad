function [ F ] = Calc_f1( M, V, PM)
%Calcul du vecteur fonction sur le bénéfice sur chaque type de produit
%M représente la matrice de contraintes
%V représente les pris de ventes par type de produit
%PM représente les valeurs limites vers lesquelles ont veut se rapprocher


	cte = [2 2 1 1 2 3 1]; %coût horaire des différentes matrices
	F = zeros(1,6);

	%Calcul du cout d'utilisation par machine 
	for j=1:7
		for i=1:6
			F(i)= F(i) +M(j,i)*cte(j)/60;
		end
	end
	
	%Ajout du prix sur les matières premières
	for i=1:6
		PM(1)*M(8,i) + PM(2)*M(9,i) + PM(3)*M(10,i)
		F(i)=F(i) + PM(1)*M(8,i) + PM(2)*M(9,i) + PM(3)*M(10,i);
	end
	
	%Retrait du prix de vente de chaque type de produit
	%(resultat = valeur négative afin de maximiser le bénéfice)
	for i= 1:6
		F(i) = F(i)-V(i);
	end
end

