%Pr0jet0


read_coordenadas_casa(X, Y) :-
							write('Choose the piece'), nl,
							write('Enter the X coordinates: '),
							read(LetterX),
							convertToColumn(LetterX, X),
							write('Enter the Y coordinates: '),
							read(LetterY),
							convertToLine(LetterY, Y).

read_orientacao(Ori, NcasasPossiveis, NcasasEscolhidas) :-
							write('You have '), write(NcasasPossiveis), write(' possible moves\n'),
							write('How many moves do you want to make?'),
							read(NcasasEscolhidas),
							valida_NcasasEscolhidas(NcasasPossiveis, NcasasEscolhidas),
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

read_rotacao(Orientacao) :-
							write('Choose the side you want to rotate the piece: e/d'),
							read(OrientacaoL),
							convertRotate(OrientacaoL,Orientacao).

convertToColumn('a',0).
convertToColumn('b',2).
convertToColumn('c',4).
convertToColumn('d',6).
convertToColumn('e',8).
convertToColumn('f',10).
convertToColumn('g',12).
convertToColumn('h',14).
convertToColumn('i',16).

convertToLine(1,0).
convertToLine(2,2).
convertToLine(3,4).
convertToLine(4,6).
convertToLine(5,8).
convertToLine(6,10).
convertToLine(7,12).
convertToLine(8,14).
convertToLine(9,16).

convertOrientacao('no', 1).
convertOrientacao('n', 2).
convertOrientacao('ne', 3).
convertOrientacao('o', 4).
convertOrientacao('e', 6).
convertOrientacao('so', 7).
convertOrientacao('s', 8).
convertOrientacao('se', 9).

convertContadorDir('c', 1).
convertContadorDir('s', 1).
convertContadorDir('l1', 3).
convertContadorDir('l2', 3).
convertContadorDir('l3', 3).
convertContadorDir('p1', 2).
convertContadorDir('p2', 2).
convertContadorDir('p3', 2).

convertRotate('e',0).
convertRotate('d',1).
