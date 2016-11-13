%Pr0jet0
:- use_module(library(lists)).
:- use_module(library(random)).
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
					joga(ModoJogo).

joga(1) :-      	ModoJogo is 1,
					player(DefaultPlayer),
					board(Default),
					repeat,
									once(retract(board(Board))),
									once(displayBoard(Board)),
									once(retract(player(Player))),
									once(jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard)),
									once(atualiza_jogador(Player)),
									once(assert(board(NovoBoard))),
					fim_deJogo(IdPeca),
					displayBoard(NovoBoard),
					menu_mensagemVitoria(Player),
					retract(board(_)),
					assert(board(Default)),
					retract(player(_)),
					assert(player(DefaultPlayer)).

joga(2)	:- 			ModoJogo is 2,
					player(DefaultPlayer),
					board(Default),
					repeat,
									once(retract(board(Board))),
									once(displayBoard(Board)),
									once(retract(player(Player))),
									once(escolhe_jogador(ModoJogo, Player, Board, IdPeca, NovoBoard)),
									once(atualiza_jogador(Player)),
									once(assert(board(NovoBoard))),
					fim_deJogo(IdPeca),
					displayBoard(NovoBoard),
					menu_mensagemVitoria(Player),
					retract(board(_)),
					assert(board(Default)),
					retract(player(_)),
					assert(player(DefaultPlayer)).
					
joga(3)	:- 			ModoJogo is 3,
					player(DefaultPlayer),
					board(Default),
					repeat,
									once(retract(board(Board))),
									once(displayBoard(Board)),
									once(retract(player(Player))),
									once(escolhe_jogador(ModoJogo, Player, Board, IdPeca, NovoBoard)),
									once(atualiza_jogador(Player)),
									once(assert(board(NovoBoard))),
					fim_deJogo(IdPeca),
					displayBoard(NovoBoard),
					menu_mensagemVitoria(Player),
					retract(board(_)),
					assert(board(Default)),
					retract(player(_)),
					assert(player(DefaultPlayer)).
%joga(ModoJogo, Board, Player, IdPeca, NovoBoard) :-
%					((ModoJogo = 1, jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard)),
%					(ModoJogo = 2, Player = 1, write('Jogo HUMANO X BOT\n')),%jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard)),
%					(ModoJogo = 2, Player = 2, IdPeca is 1, write('Vez do Bot Jogar\n')),
%					(ModoJogo = 3, IdPeca is 4, write('Jogo BOT X BOT\n'))).

escolhe_jogador(ModoJogo, Player, Board, IdPeca, NovoBoard) :-
				((ModoJogo =:= 1, jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard));
				 (ModoJogo =:= 2, Player =:= 1, jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard));
				 (ModoJogo =:= 2, Player =:= 2, jogador_Bot(ModoJogo, Player, Board, IdPeca, NovoBoard));
				 (ModoJogo =:= 3, jogador_Bot(ModoJogo, Player, Board, IdPeca, NovoBoard))).
	
jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard) :-
					menu_turnoJogador(Player), nl,
					read_utilizador(Board, X, Y, Player, TipoMove),
					faz_jogada(Board, X, Y, TipoMove, Player, NovoBoard, IdPeca).
					
jogador_Bot(ModoJogo, Player, Board,IdPeca, NovoBoard) :-
				menu_turnoJogador(Player),nl,
				read_Bot(Board, X, Y, Player, TipoMove),
				faz_jogada_bot(Board, X, Y, TipoMove, Player, NovoBoard, IdPeca).
				

read_Bot(Board, X, Y, Player, TipoMove) :-
							% Ver se peça corresponde ao jogador
				repeat,
							once(create_coordenadas_bot(X,Y)),
							once(get_bitPeca(Board, X, Y, 5, Bit)),
							once(convertPlayer(Bit, P)),
				valida_escolhaPeca(X, Y, Player, P),
							write('X: '), write(X),write('Y: '), write(Y),nl,
							repeat,
							once(create_tipoJogada_bot(TipoMove)),
				valida_Movimento(TipoMove).
				
				
create_coordenadas_bot(X,Y) :-
							random(1,10, XAntes),
							X is XAntes*2,
							random(1,10, Yantes),
							Y is Yantes*2.
	
create_tipoJogada_bot(TipoMove):-
							random(0,2,MoveAntes),
							TipoMove is MoveAntes.
	
pode_mover(Board, Xantes, Yantes, NumeroCasas, Jogador, IdPeca, Orientacao) :-
	get_novas_coordenadas(Orientacao, Xantes, Yantes, X, Y, NumeroCasas),
	valida_coordenada(X, Y),!,
	get_casa(Board, X, Y, NovaCasa),
	verifica_casaJogador(Board, X, Y, Orientacao, Jogador, NovaCasa, IdPeca),!.
	
% 			Predicados responsáveis por uma jogada
faz_jogada(Board, X, Y, 0, Jogador, NovoBoard, IdPeca) :-
					jogada_rotacao(Board, X, Y, NovoBoard, IdPeca).
					
					
faz_jogada(Board, X, Y, 1, Jogador, NovoBoard, IdPeca) :-
	ask_NumeroCasas(Board, X, Y, NcasasPossiveis, NcasasEscolhidas,Jogador, Orientacao),
	(
		(pode_mover(Board, X, Y, NcasasEscolhidas, Jogador, IdPeca, Orientacao),
		jogada_movimento(Board, X, Y, Jogador, NovoBoard, IdPeca, NcasasEscolhidas, Orientacao))
		;
		jogada_rotacao(Board, X, Y, NovoBoard, IdPeca)
	).

	
	
faz_jogada_bot(Board, X, Y, 0, Jogador, NovoBoard, IdPeca) :-
					write('Move: '),convertMove(MoveLetra, 0), write(MoveLetra),nl,
					jogada_rotacao_bot(Board, X, Y, NovoBoard, IdPeca).	

faz_jogada_bot(Board, X, Y, 1, Jogador, NovoBoard, IdPeca) :-
	write('Move: '),convertMove(MoveLetra, 1), write(MoveLetra),nl,
	read_numeroCasas_Bot(Board, X, Y, NcasasPossiveis, NcasasEscolhidas,Jogador, Orientacao),
	(
		(pode_mover(Board, X, Y, NcasasEscolhidas, Jogador, IdPeca, Orientacao),
		jogada_movimento(Board, X, Y, Jogador, NovoBoard, IdPeca, NcasasEscolhidas, Orientacao))
		;
		jogada_rotacao_bot(Board, X, Y, NovoBoard, IdPeca)
	).					
	
ask_NumeroCasas(Board, X, Y, NcasasPossiveis, NcasasEscolhidas,Jogador, Orientacao) :-
				repeat,	% Ciclo para pedir quantas casas quer mexer
								once(get_numeroCasas(Board, X, Y, NcasasPossiveis)),
								once(read_NumeroCasas(NcasasPossiveis, NcasasEscolhidas)),
				valida_NcasasUtilizador(NcasasPossiveis, NcasasEscolhidas),
				repeat,	% 	Ciclo para pedir a orientação para onde vai mover a peça
								once(read_orientacao(Orientacao, NcasasPossiveis, NcasasEscolhidas)),
				(valida_orientacaoPossivel(Board, X, Y, Orientacao, Jogador)).

read_numeroCasas_Bot(Board, X, Y, NcasasPossiveis, NcasasEscolhidas,Jogador, Orientacao) :-
				repeat,	% Ciclo para pedir quantas casas quer mexer
								once(get_numeroCasas(Board, X, Y, NcasasPossiveis)),
								once(create_numeroCasa_Bot(NcasasPossiveis, NcasasEscolhidas)),
				valida_NcasasUtilizador(NcasasPossiveis, NcasasEscolhidas),
				write('Number of moves:' ), write(NcasasEscolhidas),nl,
				repeat,	% 	Ciclo para pedir a orientação para onde vai mover a peça
								once(create_orientacao_Bot(Orientacao, NcasasPossiveis, NcasasEscolhidas)),
				(valida_orientacaoPossivel(Board, X, Y, Orientacao, Jogador)),
				write('Direction of the move: '), convertOrientacao(OrientacaoLetra, Orientacao),
				write(OrientacaoLetra),nl.

create_numeroCasa_Bot(NcasasPossiveis, NcasasEscolhidas):-
							Maximo is NcasasPossiveis + 1,
							random(1,Maximo,NCasasAntes),
							NcasasEscolhidas is NCasasAntes,
							write('Numero casas: ' ),write(NcasasEscolhidas),nl.
					
create_orientacao_Bot(Orientacao, NcasasPossiveis, NcasasEscolhidas):-
							random(1,9,OrientacaoAntes),
							((OrientacaoAntes =< 4, Orientacao is OrientacaoAntes );
							(OrientacaoAntes >= 5, Orientacao is OrientacaoAntes + 1)).
					
%				Quando escolhe fazer rotação
jogada_rotacao(Board, X, Y, NovoBoard, IdPeca) :-
					IdPeca is 1,
					repeat,	% Ciclo que vai ler o sentido em que quer rodar (Esquerda/Direita)
								once(read_rotacao(Sentido)),
					valida_rotacao(Sentido),
					rodar_peca(Board, X, Y, Sentido, NovoBoard).

jogada_rotacao_bot(Board,X,Y,NovoBoard,IdPeca):-
 					IdPeca is 1,
					repeat,	% Ciclo que vai ler o sentido em que quer rodar (Esquerda/Direita)
								once(random(0,2,SentidoAntes)),
								once(Sentido is SentidoAntes),
					valida_rotacao(Sentido),
					convertRotate(SentidoLetra,Sentido),
					write('Sentido: '), write(SentidoLetra),nl,
					rodar_peca(Board, X, Y, Sentido, NovoBoard).
					
%				Quando escolhe fazer um movimento
jogada_movimento(Board, X, Y, Player, NovoBoard, IdPeca, NcasasEscolhidas, Orientacao) :-
					mover_peca(Board, X, Y, Orientacao, Player, NovoBoard, NcasasEscolhidas, IdPeca).

valida_orientacaoPossivel(Board, X, Y, Orientacao, Jogador) :-
					valida_orientacao(Orientacao),
					verificar_bitOrientacao(Board, X, Y, Orientacao, Jogador).

atualiza_jogador(Player) :-
					((Player =:= 1, assert(player(2)));
					(Player =:= 2, assert(player(1)))).

fim_deJogo(IdPeca) :-
					IdPeca = 4.
