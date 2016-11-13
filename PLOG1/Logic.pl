% 					Verifica se bit de orientação está ativo
verificar_bitOrientacao(Board, X, Y, Orientacao, Jogador):-
							get_bitPeca(Board, X, Y, Orientacao, Bit),
							Bit == Jogador.

%========================================================================
%========================	Movement	=====================================
%========================================================================

%						Predicado responsável por mover uma peça
mover_peca(Board, Xantes, Yantes, Orientacao, NovoBoard, NcasasEscolhidas) :-
							get_novas_coordenadas(Orientacao, Xantes, Yantes, X, Y, NcasasEscolhidas),
							get_casa(Board, Xantes, Yantes, Peca), %	guardo a peca que quero mexer
							set_board_casa(X, Y, Peca, Board, MoveBoard),	%	movo a peca
							delete_board_casa(Xantes, Yantes, MoveBoard, NovoBoard). %	apago a casa onde a peca estava

%						Verifica se as coordenadas X e Y estão dentro dos limites
valida_coordenada(X,Y) :-
							X >= 0,
							X =< 16,
							Y >= 0,
							Y =< 16,
							0 is X mod 2,
							0 is Y mod 2.

% 					Verifica se a casa para onde se vai mover é vazia ou do adversário
verifica_casaJogador(Board, X, Y, Orientacao, Jogador, NovaCasa, IdPeca) :-
							valida_casaVazia(NovaCasa, IdPeca);
							valida_jogador(Board, X, Y, Orientacao, Jogador, IdPeca).

%						Verfica se a casa está vazia
valida_casaVazia(Casa, IdPeca):-
							IdPeca is 1,
							Casa=[_,0,0,0,0,0,0,0,0,0].

%						Verifica se o bit da lista da peca e do jogador 1 ou 2 e esta ativo
valida_jogador(Board, X, Y, _Orientacao, Jogador, IdPeca):-
							get_bitPeca(Board, X, Y, 5, Idjogador),
							get_bitPeca(Board, X, Y, 0, Peca),
							convertComando(Peca, IdPeca),
							convertPlayer(Idjogador,IDJogador),
							IDJogador \= Jogador.

%						Conforme a orientacao dada retorna as coordenadas para a qual a peça se vai mexer
get_novas_coordenadas(Orientacao, Xantes, Yantes, X, Y, NumeroCasas) :- % , X, Y, NewX, NewY, Ncasas) :-
							((Orientacao =:= 1, X is Xantes-(2*NumeroCasas), Y is Yantes-(2*NumeroCasas));
							(Orientacao =:= 2, X is Xantes, Y is Yantes-(2*NumeroCasas));
							(Orientacao =:= 3, X is Xantes+(2*NumeroCasas), Y is Yantes-(2*NumeroCasas));
							(Orientacao =:= 4, X is Xantes-(2*NumeroCasas), Y is Yantes);
							(Orientacao =:= 6, X is Xantes+(2*NumeroCasas), Y is Yantes);
							(Orientacao =:= 7, X is Xantes-(2*NumeroCasas), Y is Yantes+(2*NumeroCasas));
							(Orientacao =:= 8, X is Xantes, Y is Yantes+(2*NumeroCasas));
							(Orientacao =:= 9, X is Xantes+(2*NumeroCasas), Y is Yantes+(2*NumeroCasas))).

% Ler o id_peca para de seguida calcular quantas casas pode andar com aquela peça
get_numeroCasas(Board, X, Y, Ncasas) :-
							get_bitPeca(Board, X, Y, 0, Idpeca),
							convertContadorDir(Idpeca, Ncasas).

%========================================================================
%====================== Rotação	=========================================
%========================================================================

%						Predicado responsável por criar a rotação e modificar no Board
rodar_peca(Board, X, Y, Sentido, NovoBoard) :-
							criar_peca(Sentido, Board, X, Y, PecaNova),
							set_board_casa(X, Y, PecaNova, Board, NovoBoard).

%						Predicado responsável por rodas a peça para a Esquerda
criar_peca(0, Board, X, Y, PecaRodada) :-
							get_casa(Board, X, Y, Peca), %	guardo a peca que quero rodar
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

%						Predicado responsável por rodas a peça para a Direita
criar_peca(1, Board, X, Y, PecaRodada) :-
							get_casa(Board, X, Y, Peca), %	guardo a peca que quero rodar
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
