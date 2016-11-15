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
:- include('Bot.pl').
:- include('Intelligence.pl').


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

					
escolhe_jogador(ModoJogo, Player, Board, IdPeca, NovoBoard) :-
				((ModoJogo =:= 1, jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard));
				 (ModoJogo =:= 2, Player =:= 1, jogador_Humano( Player, Board, IdPeca, NovoBoard));
				 (ModoJogo =:= 2, Player =:= 2, jogador_Bot(Player, Board, IdPeca, NovoBoard));
				 (ModoJogo =:= 3, jogador_Bot( Player, Board, IdPeca, NovoBoard))).
	
jogador_Humano(Player, Board, IdPeca, NovoBoard) :-
					menu_turnoJogador(Player), nl,
					read_utilizador(Board, X, Y, Player, TipoMove),
					faz_jogada(Board, X, Y, TipoMove, Player, NovoBoard, IdPeca).
					
jogador_Bot( Player, Board,IdPeca, NovoBoard) :-
				menu_turnoJogador(Player),nl,
				read_Bot(Board, X, Y, Player, TipoMove),
				faz_jogada_bot(Board, X, Y, TipoMove, Player, NovoBoard, IdPeca).

% 			Predicados responsáveis por uma jogada
faz_jogada(Board, X, Y, 0, _Jogador, NovoBoard, IdPeca) :-
					jogada_rotacao(Board, X, Y, NovoBoard, IdPeca).
					
					
faz_jogada(Board, X, Y, 1, Jogador, NovoBoard, IdPeca) :-
	ask_NumeroCasas(Board, X, Y, NcasasEscolhidas,Jogador, Orientacao),
	(
		(pode_mover(Board, X, Y, NcasasEscolhidas, Jogador, IdPeca, Orientacao),
		jogada_movimento(Board, X, Y, NovoBoard, NcasasEscolhidas, Orientacao))
		;
		jogada_rotacao(Board, X, Y, NovoBoard, IdPeca)
	).

	
	
faz_jogada_bot(Board, X, Y, 0, _Jogador, NovoBoard, IdPeca) :-
					write('Move: '),convertMove(MoveLetra, 0), write(MoveLetra),nl,
					jogada_rotacao_bot(Board, X, Y, NovoBoard, IdPeca).	

faz_jogada_bot(Board, X, Y, 1, Jogador, NovoBoard, IdPeca) :-
	write('Move: '),convertMove(MoveLetra, 1), write(MoveLetra),nl,
	read_numeroCasas_Bot(Board, X, Y, NcasasEscolhidas,Jogador, Orientacao),
	(
		(pode_mover(Board, X, Y, NcasasEscolhidas, Jogador, IdPeca, Orientacao),
		jogada_movimento(Board, X, Y, NovoBoard, NcasasEscolhidas, Orientacao))
		;
		jogada_rotacao_bot(Board, X, Y, NovoBoard, IdPeca)
	).					
	
ask_NumeroCasas(Board, X, Y,NcasasEscolhidas,Jogador, Orientacao) :-
				repeat,	% Ciclo para pedir quantas casas quer mexer
								once(get_numeroCasas(Board, X, Y, NcasasPossiveis)),
								once(read_NumeroCasas(NcasasPossiveis, NcasasEscolhidas)),
				valida_NcasasUtilizador(NcasasPossiveis, NcasasEscolhidas),
				repeat,	% 	Ciclo para pedir a orientação para onde vai mover a peça
								once(read_orientacao(Orientacao)),
				(valida_orientacaoPossivel(Board, X, Y, Orientacao, Jogador)).

read_numeroCasas_Bot(Board, X, Y, NcasasEscolhidas,Jogador, Orientacao) :-
				repeat,	% Ciclo para pedir quantas casas quer mexer
								once(get_numeroCasas(Board, X, Y, NcasasPossiveis)),
								once(create_numeroCasa_Bot(NcasasPossiveis, NcasasEscolhidas)),
				valida_NcasasUtilizador(NcasasPossiveis, NcasasEscolhidas),
				write('Number of moves:' ), write(NcasasEscolhidas),nl,
				repeat,	% 	Ciclo para pedir a orientação para onde vai mover a peça
								once(create_orientacao_Bot(Orientacao)),
				(valida_orientacaoPossivel(Board, X, Y, Orientacao, Jogador)),
				write('Direction of the move: '), convertOrientacao(OrientacaoLetra, Orientacao),
				write(OrientacaoLetra),nl.


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
jogada_movimento(Board, X, Y, NovoBoard, NcasasEscolhidas, Orientacao) :-
					mover_peca(Board, X, Y, Orientacao, NovoBoard, NcasasEscolhidas).

atualiza_jogador(Player) :-
					((Player =:= 1, assert(player(2)));
					(Player =:= 2, assert(player(1)))).

fim_deJogo(IdPeca) :-
					IdPeca = 4.
