get_casa(Board, Coluna, Linha, Casa) :-
							nth0(Linha,Board, Line),
							nth0(Coluna, Line, Casa).

get_linha(Board, Linha, Res)  :-
							nth0(Linha, Board, Res).

set_casa(Indice, Elemento,Lista, NewLista):-
							length(AuxL, Indice),
							append(AuxL, [_|E], Lista),
							append(AuxL, [Elemento| E], NewLista).

valida_casa(Casa):-
							Casa=[_,0,0,0,0,0,0,0,0,0].

casa_com_peca(Casa):-
							Casa\=[_,0,0,0,0,0,0,0,0,0].

set_board_casa(X, Y, Casa, Board, NewBoard) :-
							get_linha(Board, Y, LinhaY),
							set_casa(X, Casa, LinhaY, ResLinhaY),
							set_casa(Y, ResLinhaY, Board, NewBoard).

mover_peca(Board, Xantes, Yantes, Orientacao, NovoBoard, NcasasEscolhidas) :-
							get_novas_coordenadas(Orientacao, Xantes, Yantes, X, Y, NcasasEscolhidas),
							valida_coordenada(X, Y),
							get_casa(Board,X, Y, CasaVazia), %guarda a casa para a qual a peça se vai mexer
							valida_casa(CasaVazia), %verifico se essa casa esta vazia
							get_casa(Board, Xantes, Yantes, Peca), %guardo a peca que quero mexer
							set_board_casa(X,Y, Peca, Board, MoveBoard),%movo a peca
							set_board_casa(Xantes, Yantes, CasaVazia, MoveBoard, NovoBoard). %apago a casa onde a peca estava

valida_coordenada(X,Y) :-
							X>=0,
							X=<16,
							Y>=0,
							Y=<16,
							0 is X mod 2,
							0 is Y mod 2.

%verifica se o bit da lista da peca e do jogador 1 ou 2 e esta ativo
valida_orientacao(Board, X, Y, Ori):-
							get_casa(Board, X, Y, Casa),
							nth0(Ori, Casa, Bit),
							((Bit == 1);
								(Bit == 2)).

%	conforme a orientacao dada retorna as coordenadas para a qual a peça se vai mexer
get_novas_coordenadas(N, X, Y, NewX, NewY, Ncasas) :-
							((N =:= 1, NewX is X-(2*Ncasas), NewY is Y-(2*Ncasas));
							(N =:= 2, NewX is X, NewY is Y-(2*Ncasas));
							(N =:= 3, NewX is X+(2*Ncasas), NewY is Y-(2*Ncasas));
							(N =:= 4, NewX is X-(2*Ncasas), NewY is Y);
							(N =:= 6, NewX is X+(2*Ncasas), NewY is Y);
							(N =:= 7, NewX is X-(2*Ncasas), NewY is Y+(2*Ncasas));
							(N =:= 8, NewX is X, NewY is Y+(2*Ncasas));
							(N =:= 0, NewX is X+(2*Ncasas), NewY is Y+(2*Ncasas))).

numero_casas(Board, X, Y, Ncasas) :-				%ler o id_peca para de seguida calcular quantas casas pode andar com aquela peça
							get_casa(Board, X, Y, Casa),
							nth0(0, Casa, Idpeca),
							convertContadorDir(Idpeca, Ncasas).


valida_NcasasEscolhidas(NcasasPossiveis, NcasasEscolhidas) :-		% verifica se o numero de casas escolhido pode ser efetuado
							NcasasEscolhidas >= 1,
							NcasasEscolhidas =< NcasasPossiveis.

%rotate
rodar_peca(Board, X, Y, Orientacao,NovoBoard) :-
							criar_peca(Orientacao,Board, X, Y,PecaNova),
							get_casa(Board,X,Y,PecaRodar),
							casa_com_peca(PecaRodar),
							set_board_casa(X,Y,PecaNova, Board,NovoBoard).

criar_peca(0, Board,X,Y, PecaRodada) :-
							get_casa(Board, X, Y, Peca), %guardo a peca que quero rodar
							nth0(0,Peca,Idpeca),
							nth0(5,Peca, Bit5),
							nth0(2,Peca, Bit1),
							nth0(3,Peca, Bit2),
							nth0(6,Peca, Bit3),
							nth0(1,Peca, Bit4),
							nth0(9,Peca, Bit6),
							nth0(4,Peca, Bit7),
							nth0(7,Peca, Bit8),
							nth0(8,Peca, Bit9),
							append([Idpeca],[Bit1], List1),
							append(List1, [Bit2], List2),
							append(List2, [Bit3], List3),
							append(List3, [Bit4], List4),
							append(List4, [Bit5], List5),
							append(List5, [Bit6], List6),
							append(List6, [Bit7], List7),
							append(List7, [Bit8], List8),
							append(List8, [Bit9], PecaRodada).



criar_peca(1,Board,X,Y, PecaRodada) :-
							get_casa(Board, X, Y, Peca), %guardo a peca que quero rodar
							nth0(0,Peca,Idpeca),
							nth0(5,Peca, Bit5),
							nth0(4,Peca, Bit1),
							nth0(1,Peca, Bit2),
							nth0(2,Peca, Bit3),
							nth0(7,Peca, Bit4),
							nth0(3,Peca, Bit6),
							nth0(8,Peca, Bit7),
							nth0(9,Peca, Bit8),
							nth0(6,Peca, Bit9),
							append([Idpeca],[Bit1], List1),
							append(List1, [Bit2], List2),
							append(List2, [Bit3], List3),
							append(List3, [Bit4], List4),
							append(List4, [Bit5], List5),
							append(List5, [Bit6], List6),
							append(List6, [Bit7], List7),
							append(List7, [Bit8], List8),
							append(List8, [Bit9], List9),
							append(List9, [Bit9], PecaRodada).
