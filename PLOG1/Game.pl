%Pr0jet0
:- use_module(library(lists)).
:- include('Board.pl').
:- include('Logic.pl').
:- include('Interface.pl').


% Implementação jogo



game:-
					board(Board),
					displayBoard(Board),
					read_ComandosGeral(X, Y, TipoMove),
					faz_jogada(Board, X, Y, TipoMove, NovoBoard),
					write('\33\[2J'),		% Comando geral de todos os sitemas que permite limpar o ecrã
					displayBoard(NovoBoard).

faz_jogada(Board, X, Y, TipoMove, NovoBoard) :-
					((TipoMove =:= 0, jogada_rotacao(Board, X, Y, NovoBoard));
					(TipoMove =:= 1, jogada_movimento(Board, X, Y, NovoBoard))).

jogada_rotacao(Board, X, Y, NovoBoard) :-
					repeat,	% Ciclo que vai ler o sentido em que quer rodar (Esquerda/Direita)
								once(read_rotacao(Sentido)),
					valida_rotacao(Sentido),
					rodar_peca(Board, X, Y, Sentido, NovoBoard).

jogada_movimento(Board, X, Y, NovoBoard) :-
					repeat,
					repeat,	% Ciclo para pedir quantas casas quer mexer
								once(numero_casas(Board, X, Y, NcasasPossiveis)),
								once(read_NumeroCasas(NcasasPossiveis, NcasasEscolhidas)),
					valida_NcasasEscolhidas(NcasasPossiveis, NcasasEscolhidas),
					repeat,	% 	Ciclo para pedir a orientação para onde vai mover a peça
								once(read_orientacao(Orientacao, NcasasPossiveis, NcasasEscolhidas)),
					valida_orientacao(Orientacao),
					mover_peca(Board, X, Y, Orientacao, NovoBoard, NcasasEscolhidas),





				%			numero_casas(Board, X, Y, NcasasPossiveis),
				%			read_orientacao(Ori, NcasasPossiveis, NcasasEscolhidas),
				%			mover_peca(Board, X, Y, Ori, NovoBoard, NcasasEscolhidas),
				%			rodar_peca(Board, X, Y, Orientacao,NovoBoard),
				%			write('\33\[2J'),
				%			displayBoard(NovoBoard).
