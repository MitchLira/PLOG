get_casa(Board, Coluna, Linha, Casa) :-
							nth0(Linha,Board, Line),
							nth0(Coluna, Line, Casa).

get_linha(Board, Linha, Res)  :-
							nth0(Linha, Board, Res).

get_bitPeca(Board, Coluna, Linha, Indice, Bit) :-
							get_casa(Board, Coluna, Linha, Casa),
							nth0(Indice, Casa, Bit).

set_casa(Indice, Elemento,Lista, NewLista):-
							length(AuxL, Indice),
							append(AuxL, [_|E], Lista),
							append(AuxL, [Elemento| E], NewLista).

set_board_casa(X, Y, Casa, Board, NewBoard) :-
							get_linha(Board, Y, LinhaY),
							set_casa(X, Casa, LinhaY, ResLinhaY),
							set_casa(Y, ResLinhaY, Board, NewBoard).

delete_board_casa(X, Y, Board, NewBoard) :-
						set_board_casa(X, Y, [z,0,0,0,0,0,0,0,0,0], Board, NewBoard).
