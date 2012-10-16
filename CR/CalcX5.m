function [  ] = CalcX5( f1, Mf, Pf )
%Permet le calcul de la solution sur le temps d'occupation 
%des machines 3 et 5 en fonction d'une variation sur le bénéfice voulu
%f1 fonction sur le bénéfice sur chaque type de produit
%Mf représente la matrice de contraintes
%Pf représente les valeurs limites vers lesquelles ont veut se rapprocher par type de contrainte

x=zeros(100,1);%stocke le bénéfice désiré
m35=zeros(1,100);%resultat d'occupation machine sur les machines 3 et 5
m3=zeros(1,100);%resultat d'occupation machine sur la machine 3
m5=zeros(1,100);%resultat d'occupation machine sur la machine 5

f33=[8 1 11 0 10 25];%temps d'occupation machine 3 par produit
f35=[5 0 0 0 10 25];%temps d'occupation machine 5 par produit


for i=1:100
	%définition d'un pas de 100 entre chaque valeur limite vers laquelle ont veut tendre pour le bénéfice
    Pf(1,11)=((10000/100)*i)*(-1);
    x(i,1)=Pf(1,11);
    
	%Calcul d'une solution pour une valeur limite
    X=linprog(f1,Mf,Pf,[],[],zeros(12,1))
	
	%Vecteurs resultat exprimant le temps d'occupation machine global pour chaque valeur limite de bénéfice
    m3(1,i)=f33*X;
    m5(1,i)=f35*X;
    m35(1,i)=f1*X;
end

%met le bénéfice en terme positif
x=-x;

%affichages des différents résultats sur un même graphe
hold on
plot(x,m35,'g-*')
plot(x,m3,'r-*')
plot(x,m5,'b-*')
