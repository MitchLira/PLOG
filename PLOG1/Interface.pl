%		Predicado que vai ler os dois primeiros inputs (peça a mexer e tipo movimento)
read_utilizador(Board, X, Y, Player, TipoMove) :-
							% Ver se peça corresponde ao jogador
							repeat,
										once(read_coordenadas_casa(X,Y)),
										once(get_bitPeca(Board, X, Y, 5, Bit)),
										once(convertPlayer(Bit, P)),
							valida_escolhaPeca(X, Y, Player, P),
							repeat,
										once(read_TipoJogada(TipoMove)),
							valida_Movimento(TipoMove).

read_coordenadas_casa(X, Y) :-
							write('Choose the piece'), nl,
							write('Enter the X coordinates: '),
							read(LetterX),
							convertToColumn(LetterX, X),
							write('Enter the Y coordinates: '),
							read(LetterY),
							convertToLine(LetterY, Y).

read_TipoJogada(TipoMove) :-
							write('what do you want to do? rotation or movement?\n'),
							read(Move),
							convertMove(Move, TipoMove).

read_rotacao(Sentido) :-
							write('Choose the side you want to rotate the piece: left/right'),
							read(SentidoL),
							convertRotate(SentidoL,Sentido).

read_NumeroCasas(NcasasPossiveis, NcasasEscolhidas) :-
							write('You have '), write(NcasasPossiveis), write(' possible moves\n'),
							write('How many moves do you want to make?'),
							read(NcasasEscolhidas).

read_orientacao(Ori, NcasasPossiveis, NcasasEscolhidas) :-
							write('Choose the direction of the movement: '), nl,
							write('no\n'),
							write('n\n'),
							write('ne\n'),
							write('o\n'),
							write('e\n'),
							write('so\n'),
							write('s\n'),
							write('se\n'),
							read(Orientacao),
							convertOrientacao(Orientacao, Ori).

%		Predicado que verifica se a peça pertence ao jogador
valida_escolhaPeca(X, Y, Player, Bit) :-
							valida_coordenada(X, Y),
							Player == Bit.

valida_rotacao(Sentido) :-
							Sentido = 0;	% Esquerda
							Sentido = 1.	% Direita

valida_Movimento(TipoMove) :-
							TipoMove = 0; %Rotacao
							TipoMove = 1.	%Movimento

valida_NcasasUtilizador(NcasasPossiveis, NcasasEscolhidas) :-		% verifica se o numero de casas escolhido pode ser efetuado
							NcasasEscolhidas >= 1,
							NcasasEscolhidas =< NcasasPossiveis.

valida_orientacao(Orientacao) :-
							Orientacao = 1; % NO
							Orientacao = 2; % N
							Orientacao = 3; % NE
							Orientacao = 4; % O
							Orientacao = 6; % E
							Orientacao = 7; % SO
							Orientacao = 8; % S
							Orientacao = 9. % SE

clear_screen :-
							write('\33\[2J').						
							
%						Conversões das letras que identificam os jogadores
convertPlayer(a, 1).
convertPlayer(b, 2).

%						Conversões do tipo de movimento escolhido
convertMove('rotation', 0).
convertMove('Rotation',0).
convertMove('movement', 1).
convertMove('Movement',1).

%						Conversões das colunas, passamos de strings para números
convertToColumn('a',0).
convertToColumn('b',2).
convertToColumn('c',4).
convertToColumn('d',6).
convertToColumn('e',8).
convertToColumn('f',10).
convertToColumn('g',12).
convertToColumn('h',14).
convertToColumn('i',16).

%						Conversões das linhas para os indices para aceder ao Board
convertToLine(1,0).
convertToLine(2,2).
convertToLine(3,4).
convertToLine(4,6).
convertToLine(5,8).
convertToLine(6,10).
convertToLine(7,12).
convertToLine(8,14).
convertToLine(9,16).

%						Conversões do sentido de rotação
convertRotate('left',0).	% Esquerda
convertRotate('right',1).	%	Direita

%						Conversões do número de casas que uma peça se pode mover, consoante o seu Idpeca
convertContadorDir('c', 1).
convertContadorDir('s', 1).
convertContadorDir('l1', 3).
convertContadorDir('l2', 3).
convertContadorDir('l3', 3).
convertContadorDir('p1', 2).
convertContadorDir('p2', 2).
convertContadorDir('p3', 2).

%						Conversões das orientações dos movimentos
convertOrientacao('no', 1).
convertOrientacao('n', 2).
convertOrientacao('ne', 3).
convertOrientacao('o', 4).
convertOrientacao('e', 6).
convertOrientacao('so', 7).
convertOrientacao('s', 8).
convertOrientacao('se', 9).
