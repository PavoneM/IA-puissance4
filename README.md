# IA-puissance4
Projet pour le module Intelligence Artificielle I de l'université Laval

Collaborateurs : Manuel Pavone / Farouk Hamdane

Nous avions décidé de choisir le jeu Puissance 4 pour cette modélisation. Le jeu nous a semblé à la fois intéressant et en même temps assez simple pour la modélisation et la recherche d’états. En effet, le jeu se présente sous la forme d’une grille 7 x 6 : 6 rangées et 7 colonnes. 

Le jeu se joue à deux, un joueur joue avec les pièces rouges et un autre avec les pièces jaunes.  Le joueur qui arrive le premier à aligner 4 pièces (et ceux quelque soit la configuration de l’alignement : horizontal, vertical ou diagonale)  de la couleur lui appartenant met fin à la partie en remportant la victoire. 

= > En revanche, si toutes les cases sont remplies et qu’aucun alignement de 4 pièces de la même couleur ne se présente, la partie est déclarée nulle pour les deux joueurs. Il faut noter que le jeu se joue avec une grille physique qui est positionnée perpendiculairement au sol, le choix des cases se limite donc aux cases vides positionnées au plus bas de chacune des colonnes de la grille en tenant compte des pièces déjà positionnées. 


Description de l'IA : 
- Implémentant l'algorithme "Meilleur d'abord"
- Dans le jeu Puissance 4, le joueur qui commence gagne toujours. Donc notre IA devrait pouvoir gagner dans tous les cas

