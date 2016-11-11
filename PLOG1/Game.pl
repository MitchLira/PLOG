%Pr0jet0
:- use_module(library(lists)).
:- include('Board.pl').
:- include('Logic.pl').
:- include('Interface.pl').
:- include('Utils.pl').


% Implementação jogo



game:-
					board(Board),
					displayBoard(Board),
					write('Choose the Player number: '),
					read(Player),

					read_utilizador(Board, X, Y, Player, TipoMove),

					faz_jogada(Board, X, Y, TipoMove, Player, NovoBoard),
					%write('\33\[2J'),		% Comando geral de todos os sitemas que permite limpar o ecrã
					displayBoard(NovoBoard).

faz_jogada(Board, X, Y, TipoMove, Player, NovoBoard) :-
					((TipoMove =:= 0, jogada_rotacao(Board, X, Y, NovoBoard));
					(TipoMove =:= 1, jogada_movimento(Board, X, Y, Player, NovoBoard))).

jogada_rotacao(Board, X, Y, NovoBoard) :-
					repeat,	% Ciclo que vai ler o sentido em que quer rodar (Esquerda/Direita)
								once(read_rotacao(Sentido)),
					valida_rotacao(Sentido),
					rodar_peca(Board, X, Y, Sentido, NovoBoard).

jogada_movimento(Board, X, Y, Player, NovoBoard) :-
					repeat,	% Ciclo para pedir quantas casas quer mexer
								once(get_numeroCasas(Board, X, Y, NcasasPossiveis)),
								once(read_NumeroCasas(NcasasPossiveis, NcasasEscolhidas)),
					valida_NcasasUtilizador(NcasasPossiveis, NcasasEscolhidas),
					repeat,	% 	Ciclo para pedir a orientação para onde vai mover a peça
								once(read_orientacao(Orientacao, NcasasPossiveis, NcasasEscolhidas)),
					((valida_orientacao(Orientacao)),(verificar_bitOrientacao(Board, X, Y, Orientacao, Player))),
					mover_peca(Board, X, Y, Orientacao, Player, NovoBoard, NcasasEscolhidas).
