


read_Bot(Board, X, Y, Player, TipoMove) :-
							% Ver se peça corresponde ao jogador
				repeat,
							once(create_coordenadas_bot(X,Y)),
							once(get_bitPeca(Board, X, Y, 5, Bit)),
							once(convertPlayer(Bit, P)),
				valida_escolhaPeca(X, Y, Player, P),
							write('X: '), write(X),write(' Y: '), write(Y),nl,
							repeat,
							once(create_tipoJogada_bot(TipoMove)),
				valida_Movimento(TipoMove).
				
				
create_coordenadas_bot(X,Y) :-
							random(0,10, XAntes),
							X is XAntes*2,
							random(0,10, Yantes),
							Y is Yantes*2.
	
create_tipoJogada_bot(TipoMove):-
							random(0,2,MoveAntes),
							TipoMove is MoveAntes.

							create_numeroCasa_Bot(NcasasPossiveis, NcasasEscolhidas):-
							Maximo is NcasasPossiveis + 1,
							random(1,Maximo,NCasasAntes),
							NcasasEscolhidas is NCasasAntes,
							write('Numero casas: ' ),write(NcasasEscolhidas),nl.
					
create_orientacao_Bot(Orientacao):-
							random(1,9,OrientacaoAntes),
							((OrientacaoAntes =< 4, Orientacao is OrientacaoAntes );
							(OrientacaoAntes >= 5, Orientacao is OrientacaoAntes + 1)).
					