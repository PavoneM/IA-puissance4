%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Enchainnement tours joueur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Si tous les éléments d'une liste sont égaux
testMemeElements([],_,0).
testMemeElements([J|Q], J, N) :- testMemeElements(Q, J, X), N is X+1,write(N).

% Premier test etat final : Tous en colonne 
testVertical([T|_],J):- testMemeElements(T, J, N), N == 4, !.
testVertical([_|Q],J):- testVertical(Q,J).

testHorizontal(Grille, Ligne,J):- maplist(nthElem(Ligne), Grille, L), sublist([J,J,J,J], L), !.

prefix(P,L):-append(P,_,L).
sublist(S,L):-prefix(S,L).
sublist(S,[_|T]):-sublist(S,T).

%etat_final(G, J) :- ([[J,J,J,J],[B],[C],[D],[E],[F],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[J,J,J,J],[C],[D],[E],[F],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[B],[J,J,J,J],[D],[E],[F],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[B],[C],[J,J,J,J],[E],[F],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[B],[C],[D],[J,J,J,J],[F],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[B],[C],[D],[E],[J,J,J,J],[G]],J), affiche_gagnant(J).
%etat_final(G, J) :- ([[A],[B],[C],[D],[E],[F],[J,J,J,J]],J), affiche_gagnant(J).

% Afficher le symbole du joueur gagnant
affiche_gagnant(J) :- write('Le Joueur '), write(J), write(' a gagné !').

joueur1(G) :- testVertical(G,o),affiche_gagnant(x),  !.
joueur2(G) :- testVertical(G,x),affiche_gagnant(o),  !.

joueur1(G) :- testHorizontal(G, 1,o),affiche_gagnant(x),  !.
joueur2(G) :- testHorizontal(G, 1,x),affiche_gagnant(o),  !.

joueur1(G) :- write('Joueur X, quelle colonne ?   '), read(Colonne), etat(G, Colonne, x, NouvelleGrille), ui(NouvelleGrille), joueur2(NouvelleGrille).
joueur2(G) :- write('Joueur O, quelle colonne ?   '), read(Colonne), etat(G, Colonne, o, NouvelleGrille), ui(NouvelleGrille), joueur1(NouvelleGrille).

% Ajouter un nouvel etat
etat([T|Q], 1, Joueur, [[Joueur|T]|Q]).
etat([T|Q], Colonne, Joueur, [T|X]) :- Colonne > 0, Compteur is Colonne-1, etat(Q, Compteur, Joueur, X).


reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Action à excécuter pour lancer la partie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% La gille se compose en 6 colonnes de N élements pour l'instant
jouer:- joueur1([[],[],[],[],[],[],[]]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Afficher grille
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%
%	La clause ui(Grille, 6) genere une grille commme ceci:
%
%	-----------------------------
%	| x | o | x | o | x | o | x |
%	| x | o | x | o | x | o | x |
%	| x | o | x | o | x | o | x |
%	| x | o | x | o | x | o | x |
%	| x | o | x | o | x | o | x |
%	| x | o | x | o | x | o | x |
%	-----------------------------
%	
%

ui(Grille) :- prem_dern_ligne, gen_grille(Grille, 6),prem_dern_ligne.

prem_dern_ligne :- write(' -----------------------------\n').

% Trouvée sur internet, maplist est une clause deja integree a prolog
% qui permet d'appliquer un predicat à chaque element d'une liste
gen_grille(_,0).							   
gen_grille(Grille, Ligne):-	Ligne > 0, Compteur is Ligne-1, maplist(nthElem(Ligne), Grille, L), disp_ligne(L), write('\n'), gen_grille(Grille, Compteur).

disp_ligne([]):- write(' | ').
disp_ligne([E|L]):-  write(' | '), piece_ou_vide(E), disp_ligne(L).
piece_ou_vide([]):- write(' '),!.
piece_ou_vide(E):- write(E).

% Retourne la taille de la liste N
taille_liste([],0).
taille_liste([_|Liste],Taille):- taille_liste(Liste,X), Taille is X+1.

% Recupere le l'élement à l'indice Taille
nthElem(Taille, Liste, []):- taille_liste(Liste, N1), N1 < Taille.

% nth1 retourne dans X l'element (fonction trouvée sur internet)
nthElem(Taille, Liste, X):- nth1(Taille, Liste, X).