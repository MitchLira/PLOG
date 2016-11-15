%						Predicado que retona uma linha do Board
get_linha(Board, Linha, Res)  :-
							nth0(Linha, Board, Res).

% 					Predicado que retorna em Casa a casa que está na posição (Coluna, Linha)
get_casa(Board, Coluna, Linha, Casa) :-
							nth0(Linha,Board, Line),
							nth0(Coluna, Line, Casa).

%						Predicado que retorn o Bit de uma certa casa do tabuleiro
get_bitPeca(Board, Coluna, Linha, Indice, Bit) :-
							get_casa(Board, Coluna, Linha, Casa),
							nth0(Indice, Casa, Bit).

%						Predicado responsável
set_board_casa(X, Y, Casa, Board, NewBoard) :-
							get_linha(Board, Y, LinhaY),
							set_casa(X, Casa, LinhaY, ResLinhaY),
							set_casa(Y, ResLinhaY, Board, NewBoard).

%						Predicado responsável por modificar uma casa numa certa Linha do Board
set_casa(Indice, Elemento,Lista, NewLista):-
							length(AuxL, Indice),
							append(AuxL, [_|E], Lista),
							append(AuxL, [Elemento| E], NewLista).

%						Predicado respponsável por colocar uma casa vazia
delete_board_casa(X, Y, Board, NewBoard) :-
						set_board_casa(X, Y, [z,0,0,0,0,0,0,0,0,0], Board, NewBoard).
