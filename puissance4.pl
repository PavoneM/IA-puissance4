%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Enchainnement tours joueur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Si tous les éléments d'une liste sont égaux
testMemeElements([],J).
testMemeElements([J|Q], J) :- testMemeElements(Q, J).

% Premier test etat final : Tous en colonne 
testVertical([T|_],J):- testMemeElements([J,J,J,J], T),!.
testVertical([_|Q],J):- testVertical(Q,J).

%etat_final(G, J) :- ([[J,J,J,J],[B],[C],[D],[E],[F],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[J,J,J,J],[C],[D],[E],[F],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[B],[J,J,J,J],[D],[E],[F],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[B],[C],[J,J,J,J],[E],[F],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[B],[C],[D],[J,J,J,J],[F],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[B],[C],[D],[E],[J,J,J,J],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[B],[C],[D],[E],[F],[J,J,J,J]],J), affiche_gagnant(J).

% Afficher le symbole du joueur gagnant
affiche_gagnant(J) :- write('Le Joueur '), write(J), write(' a gagné !').

joueur1(G) :- testVertical(G, x), !.
joueur2(G) :- testVertical(G, o), !.

joueur1(G) :- write('Joueur X, quelle colonne ?   '), read(Colonne), etat(G, Colonne, x, NouvelleGrille), write(NouvelleGrille), joueur2(NouvelleGrille).
joueur2(G) :- write('Joueur O, quelle colonne ?   '), read(Colonne), etat(G, Colonne, o, NouvelleGrille), write(NouvelleGrille), joueur1(NouvelleGrille).

% Ajouter un nouvel etat
etat([T|Q], 1, Joueur, [[Joueur|T]|Q]).
etat([T|Q], Colonne, Joueur, [T|X]) :- Colonne > 0, Compteur is Colonne-1, etat(Q, Compteur, Joueur, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Action à excécuter pour lancer la partie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% La gille se compose en 6 colonnes de N élements pour l'instant
jouer:- joueur1([[],[],[],[],[],[],[]]).