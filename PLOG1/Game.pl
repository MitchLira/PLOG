%Pr0jet0
:- use_module(library(lists)).
:- dynamic(board/1).
:- dynamic(player/1).
:- include('Board.pl').
:- include('Logic.pl').
:- include('Interface.pl').
:- include('Utils.pl').
:- include('Menus.pl').


% Implementação jogo

ploy :-
					menu_inicial(ModoJogo),
					player(DefaultPlayer),
					board(Default),
					repeat,
									once(retract(board(Board))),
									once(write('ola1\n')),
									once(displayBoard(Board)),
									once(write('ola2\n')),
									once(retract(player(Player))),
									once(write('ola3\n')),
									%once(joga(ModoJogo, Board, Player, IdPeca, NovoBoard)),
									once(write('ola4\n')),
									once(jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard)),
									once(atualiza_jogador(Player)),
									%once(write('ola5\n')),
									once(assert(board(NovoBoard))),
									once(write('ola6\n')),
					fim_deJogo(IdPeca),
					displayBoard(NovoBoard),
					menu_mensagemVitoria(Player),
					retract(board(_)),
					assert(board(Default)),
					retract(player(_)),
					assert(player(DefaultPlayer)).

joga(ModoJogo, Board, Player, IdPeca, NovoBoard) :-
					((ModoJogo = 1, jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard)),
					(ModoJogo = 2, Player = 1, write('Jogo HUMANO X BOT\n')),%jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard)),
					(ModoJogo = 2, Player = 2, IdPeca is 1, write('Vez do Bot Jogar\n')),
					(ModoJogo = 3, IdPeca is 4, write('Jogo BOT X BOT\n'))).

jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard) :-
					menu_turnoJogador(Player), nl,
					read_utilizador(Board, X, Y, Player, TipoMove),
					faz_jogada(Board, X, Y, TipoMove, Player, NovoBoard, IdPeca).

% 			Predicados responsáveis por uma jogada
faz_jogada(Board, X, Y, TipoMove, Player, NovoBoard, IdPeca) :-
					((TipoMove =:= 0, jogada_rotacao(Board, X, Y, NovoBoard, IdPeca));
					(TipoMove =:= 1, jogada_movimento(Board, X, Y, Player, NovoBoard, IdPeca))).

%				Quando escolhe fazer rotação
jogada_rotacao(Board, X, Y, NovoBoard, IdPeca) :-
					IdPeca is 1,
					repeat,	% Ciclo que vai ler o sentido em que quer rodar (Esquerda/Direita)
								once(read_rotacao(Sentido)),
					valida_rotacao(Sentido),
					rodar_peca(Board, X, Y, Sentido, NovoBoard).

%				Quando escolhe fazer um movimento
jogada_movimento(Board, X, Y, Player, NovoBoard, IdPeca) :-
					repeat,	% Ciclo para pedir quantas casas quer mexer
								once(get_numeroCasas(Board, X, Y, NcasasPossiveis)),
								once(read_NumeroCasas(NcasasPossiveis, NcasasEscolhidas)),
					valida_NcasasUtilizador(NcasasPossiveis, NcasasEscolhidas),
					repeat,	% 	Ciclo para pedir a orientação para onde vai mover a peça
								once(read_orientacao(Orientacao, NcasasPossiveis, NcasasEscolhidas)),
					valida_orientacaoPossivel(Board, X, Y, Orientacao, Player),
					mover_peca(Board, X, Y, Orientacao, Player, NovoBoard, NcasasEscolhidas, IdPeca).

valida_orientacaoPossivel(Board, X, Y, Orientacao, Player) :-
					((valida_orientacao(Orientacao)),
					(verificar_bitOrientacao(Board, X, Y, Orientacao, Player))).

atualiza_jogador(Player) :-
					((Player =:= 1, assert(player(2)));
					(Player =:= 2, assert(player(1)))).

fim_deJogo(IdPeca) :-
					IdPeca = 4.
