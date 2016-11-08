%Pr0jet0
:- use_module(library(lists)).

board([
		[[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[l1,0,0,0,1,a,1,0,1,0],[t,0,0,0,t,t,t,0,0,0],[l2,0,1,0,0,a,0,1,0,1],[t,0,0,0,t,t,t,0,0,0],[l3,0,0,0,0,a,0,1,1,1],[t,0,0,0,t,t,t,0,0,0],[c,1,0,1,0,a,0,1,0,1],[t,0,0,0,t,t,t,0,0,0],[l3,0,0,0,0,a,0,1,1,1],[t,0,0,0,t,t,t,0,0,0],[l2,0,1,0,0,a,0,1,0,1],[t,0,0,0,t,t,t,0,0,0],[l1,0,0,0,1,a,1,0,1,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0]],
		[[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0]],
		[[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[p1,0,0,0,0,a,0,0,1,1],[t,0,0,0,t,t,t,0,0,0],[p2,0,0,0,0,a,0,1,0,1],[t,0,0,0,t,t,t,0,0,0],[p3,0,1,0,0,a,0,0,1,0],[t,0,0,0,t,t,t,0,0,0],[p2,0,0,0,0,a,0,1,0,1],[t,0,0,0,t,t,t,0,0,0],[p1,0,0,0,0,a,0,1,1,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0]],
		[[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0]],
		[[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[s,0,0,0,0,a,0,0,1,0],[t,0,0,0,t,t,t,0,0,0],[s,0,0,0,0,a,0,0,1,0],[t,0,0,0,t,t,t,0,0,0],[s,0,0,0,0,a,0,0,1,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0]],
		[[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0]],
		[[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0]],
		[[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0]],
		[[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0]],
		[[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0]],
		[[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0]],
		[[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0]],
		[[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[s,0,2,0,0,b,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[s,0,2,0,0,b,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[s,0,2,0,0,b,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0]],
		[[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0]],
		[[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[p1,0,2,2,0,b,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[p2,2,0,2,0,b,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[p3,0,2,0,0,b,0,0,2,0],[t,0,0,0,t,t,t,0,0,0],[p2,2,0,2,0,b,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[p1,2,2,0,0,b,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0]],
		[[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0],[z,be,0,bd,bd,0,be],[z,0,bv,0,0,bv,0]],
		[[z,0,0,0,0,0,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[l1,0,2,0,2,b,2,0,0,0],[t,0,0,0,t,t,t,0,0,0],[l2,2,0,2,0,b,0,0,2,0],[t,0,0,0,t,t,t,0,0,0],[l3,2,2,2,0,b,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[c,2,0,2,0,b,0,2,0,2],[t,0,0,0,t,t,t,0,0,0],[l3,2,2,2,0,b,0,0,0,0],[t,0,0,0,t,t,t,0,0,0],[l2,2,0,2,0,b,0,0,2,0],[t,0,0,0,t,t,t,0,0,0],[l1,0,2,0,2,b,2,0,0,0],[t,0,0,0,t,t,t,0,0,0],[z,0,0,0,0,0,0,0,0,0]]
]).

% translates dos simbolos das peças
translate(1,'+'). % 1 significa simbolo para jogador 1
translate(2,'*'). % 2 significa simbolo para jogador 2
translate(0,' '). % representa um espaço

% translates dos simbolos que reprensentam os caminhos
translate(t,'-'). % representa um traço
translate(bv,'|'). % barra vertical
translate(bd,'/'). % barra lateral direito
translate(be,'\\'). % barra lateral esquerdo

% translates dos ids dos jogadores
translate(a,'1').
translate(b,'2').



%===========================================================================================================
%============================================	REGRAS		================================================
%===========================================================================================================

%												DISPLAY DE UM TABULEIRO

displayBoard(Board) :-
											display_bords_up,
											display_board(Board,1),
											display_board_down.

display_bords_up :-
											nl, nl, nl,
											write('  a     b     c     d     e     f     g     h     i '),
											nl, nl.

display_board_down :-
		nl, nl, nl.

display_board([L1,L2|Ls], N) :-
		write(' '),
		display_lineTop(L1),	% 	Display Parte de cima de cada peça
		write(N),
		display_lineMid(L1),	% 	Display Parde do meio de cada peça
		write(' '),
		display_lineDown(L1),	% 	Display Parte de baixo de cada peça
		write(' '),
		display_lineTop(L2),	% 	Display Parte de cima dos caminhos entre cada linha de peças
		write(' '),
		display_lineMid(L2),	% 	Display Parte de baixo dos caminhos entre cada linha de peças
		N1 is N+1,
		display_board(Ls, N1).

display_board([L1|[]], N) :- 		% 	Chama esta função quando na recursividade quando é para fazer display da última linha
		write(' '),
		display_lineTop(L1),	% 	Estas 3 linhas seguintes é como anteriormente
		write(N),
		display_lineMid(L1),
		write(' '),
		display_lineDown(L1),
		display_board([]).

display_board([]) :- nl.		% 	Condição de paragem para o display



% 									Vamos apenas ignorar o primeiro elemento da lista
display_lineTop([L1|Ls]) :-
		display_Top(L1),
		display_lineTop(Ls).

display_lineTop([]) :- nl.

display_Top([E1|Ls]) :-
		junta_pecas(Ls,T).



%									Vamos ignorar o primeiro e a parte de cima, isto é, os 3 seguintes
display_lineMid([L1|Ls]) :-
		display_Mid(L1),
		display_lineMid(Ls).

display_lineMid([]) :- nl.

display_Mid([E1,E2,E3,E4|Ls]) :-
		junta_pecas(Ls,T).



%									Vamos ignorar o primeiro, a parte de cima e a parte do meio, isto é, os 6 seguintes
display_lineDown([L1|Ls]) :-
		display_Down(L1),
		display_lineDown(Ls).

display_lineDown([]) :- nl.

display_Down([E1,E2,E3,E4,E5,E6,E7|Ls]) :-
		junta_pecas(Ls,T).



%									Faz append das partes todas, isto é, faz append das aprtes de cima das peças e depois display destas mesmas
junta_pecas([E1,E2,E3|Ls],T) :-
		append([E1,E2,E3],[],T),
		display_peca(T).



display_peca([E1|Es]) :-
		translate(E1,P),
		write(P),
		display_peca(Es).

display_peca([]) :- write('').


% game

game :-
					board(Board),
					displayBoard(Board),
					play(a, Board).

play(Player, Board) :-
													write('Player '),
													translate(Player, P),
													write(P), write(' turn!'),
													nl,
													read_coordinates(X,Y),
													write(X), nl, write(Y).

read_coordinates(X,Y) :-
														write('Choose the piece'), nl,
														write('Enter the X coordinates: '),
														read(X),
														write('Enter the Y coordinates: '),
														read(Y).
