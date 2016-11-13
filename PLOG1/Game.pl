%Pr0jet0
:- use_module(library(lists)).
:- use_module(library(random)).
:- use_module(library(sleep)).
:- dynamic(board/1).
:- dynamic(player/1).
:- include('Board.pl').
:- include('Logic.pl').
:- include('Interface.pl').
:- include('Utils.pl').
:- include('Menus.pl').

%RANDOM(MINIMO, MAXIMO+1,VARIAVELAGUARDAR)

% Implementação jogo
ploy :-
					menu_inicial(ModoJogo),
					joga(ModoJogo).

%humano vs humano
joga(1) :-      	ModoJogo is 1,
					player(DefaultPlayer),
					board(Default),
					repeat,
									once(retract(board(Board))),
									once(displayBoard(Board)),
									once(retract(player(Player))),
									once(jogador_Humano(Player, Board, IdPeca, NovoBoard, ModoJogo)),
									once(atualiza_jogador(Player)),
									once(assert(board(NovoBoard))),
					fim_deJogo(IdPeca),
					displayBoard(NovoBoard),
					menu_mensagemVitoria(Player),
					retract(board(_)),
					assert(board(Default)),
					retract(player(_)),
					assert(player(DefaultPlayer)).

%humano vs bot
joga(2) :- 			ModoJogo is 2,
					player(DefaultPlayer),
					board(Default),
					repeat,
									once(retract(board(Board))),
									once(displayBoard(Board)),
									once(retract(player(Player))),
									once(escolhe_jogador(Player, Board, IdPeca, NovoBoard, ModoJogo)),
									once(atualiza_jogador(Player)),
									once(assert(board(NovoBoard))),
					fim_deJogo(IdPeca),
					displayBoard(NovoBoard),
					menu_mensagemVitoria(Player),
					retract(board(_)),
					assert(board(Default)),
					retract(player(_)),
					assert(player(DefaultPlayer)).

%bot vs bot
joga(3) :- 			ModoJogo is 3,
					player(DefaultPlayer),
					board(Default),
					repeat,
									once(retract(board(Board))),
									once(displayBoard(Board)),
									once(retract(player(Player))),
									once(escolhe_jogador(Player, Board, IdPeca, NovoBoard, ModoJogo)),
									once(atualiza_jogador(Player)),
									once(assert(board(NovoBoard))),
					fim_deJogo(IdPeca),
					displayBoard(NovoBoard),
					menu_mensagemVitoria(Player),
					retract(board(_)),
					assert(board(Default)),
					retract(player(_)),
					assert(player(DefaultPlayer)).


escolhe_jogador(Player, Board, IdPeca, NovoBoard, ModoJogo) :-
			((Player =:= 1,ModoJogo =:= 2, jogador_Humano(Player, Board, IdPeca, NovoBoard,ModoJogo));
			(Player =:= 2,ModoJogo =:= 2, jogador_Bot(Player, Board, IdPeca, NovoBoard,ModoJogo));
			(ModoJogo =:= 3, jogador_Bot(Player, Board,IdPeca, NovoBoard, ModoJogo))).

jogador_Bot(Player, Board, IdPeca, NovoBoard,ModoJogo) :-
			menu_turnoJogador(Player), nl,
			criar_variaveis_random(Player,Board, IdPeca, NovoBoard, X,Y, TipoMove),
			faz_jogada_Bot(Board,X,Y, TipoMove, Player,NovoBoard, IdPeca,ModoJogo).

jogador_Humano(Player, Board, IdPeca, NovoBoard, ModoJogo) :-
					menu_turnoJogador(Player), nl,
					read_utilizador(Board, X, Y, Player, TipoMove),
					faz_jogada(Board, X, Y, TipoMove, Player, NovoBoard, IdPeca,ModoJogo).

%joga(ModoJogo, Board, Player, IdPeca, NovoBoard) :-
%					((ModoJogo = 1, jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard)),
%					(ModoJogo = 2, Player = 1, write('Jogo HUMANO X BOT\n')),%jogador_Humano(ModoJogo, Player, Board, IdPeca, NovoBoard)),
%					(ModoJogo = 2, Player = 2, IdPeca is 1, write('Vez do Bot Jogar\n')),
%					(ModoJogo = 3, IdPeca is 4, write('Jogo BOT X BOT\n'))).



criar_variaveis_random(Player, Board, IdPeca,NovoBoard, X, Y, TipoMove):-
					repeat,
						once(random(0,9,X1)),
						X is X1 * 2,
						once(random(0,9,Y1)),
						Y is Y1 * 2,
						once(get_bitPeca(Board, X, Y, 5, Bit)),
						once(convertPlayer(Bit, P)),
					(valida_escolhaPeca(X, Y, Player, P),valida_casaVazia(Casa, IdPeca)),
					write('X: '),write(X), write('Y: '), write(Y),nl,
					repeat,
						once(random(0,2,TipoMove1)),
						TipoMove is TipoMove1,
						write('TipoMove: '), write(TipoMove), nl,
					valida_Movimento(TipoMove).





jogador_Bot(Player, Board, IdPeca,NovoBoard) :-
					menu_turnoJogador(Player),nl,
					criar_variaveis_random(Player, Board,IdPeca,NovoBoard, X,Y, TipoMove),
					faz_jogada_Bot(Board,X, Y,TipoMove , Jogador, NovoBoard, IdPeca, ModoJogo).

pode_mover(Board, Xantes, Yantes, NumeroCasas, Jogador, IdPeca, Orientacao) :-
	get_novas_coordenadas(Orientacao, Xantes, Yantes, X, Y, NumeroCasas),
	valida_coordenada(X, Y),!,
	get_casa(Board, X, Y, NovaCasa),
	verifica_casaJogador(Board, X, Y, Orientacao, Jogador, NovaCasa, IdPeca),!.

% 			Predicados responsáveis por uma jogada
faz_jogada(Board, X, Y, 0, Jogador, NovoBoard, IdPeca,ModoJogo) :-
				jogada_rotacao(Board, X, Y,Jogador, NovoBoard, IdPeca,ModoJogo).

faz_jogada_Bot(Board,X,Y, 0, Jogador,NovoBoard, IdPeca,ModoJogo) :-
				jogada_rotacao(Board, X, Y,Jogador, NovoBoard, IdPeca,ModoJogo).

faz_jogada(Board, X, Y, 1, Jogador, NovoBoard, IdPeca,ModoJogo) :-
	ask_NumeroCasas(Board, X, Y, NcasasPossiveis, NcasasEscolhidas,Jogador, Orientacao),
	(
		(pode_mover(Board, X, Y, NcasasEscolhidas, Jogador, IdPeca, Orientacao),
		jogada_movimento(Board, X, Y, Jogador, NovoBoard, IdPeca, NcasasEscolhidas, Orientacao))
		;
		jogada_rotacao(Board, X, Y, Jogador, NovoBoard, IdPeca,ModoJogo)
	).

faz_jogada_Bot(Board,X,Y, 1, Jogador,NovoBoard, IdPeca, ModoJogo) :-
	criar_variaveis_random_movimento(Jogador, Board, IdPeca, NovoBoard, X, Y, 1, NcasasEscolhidas, Orientacao),
	(
		(pode_mover(Board, X, Y, NcasasEscolhidas, Jogador, IdPeca, Orientacao),
		jogada_movimento(Board, X, Y, Jogador, NovoBoard, IdPeca, NcasasEscolhidas, Orientacao))
		;
		jogada_rotacao(Board, X, Y, Jogador, NovoBoard, IdPeca, ModoJogo)
	).

criar_variaveis_random_movimento(Player, Board, IdPeca, NovoBoard, X, Y, TipoMove, NcasasEscolhidas, Orientacao) :-
			repeat,	% Ciclo para pedir quantas casas quer mexer
				once(get_numeroCasas(Board, X, Y, NcasasPossiveis)),
				Maximo is NcasasPossiveis + 1,
				once(random(1,Maximo, NrCasas)),
				once(NcasasEscolhidas is NrCasas),
				write('NcasasEscolhidas: '),write(NcasasEscolhidas),nl,
			valida_NcasasUtilizador(NcasasPossiveis, NcasasEscolhidas),
			criar_variaveis_random_orientacao(Board, X, Y, Player, Orientacao).

criar_variaveis_random_orientacao(Board, X, Y, Player, Orientacao):-
			repeat,	% 	Ciclo para pedir a orientação para onde vai mover a peça
					once(random(1,10,Ori)),
				    ((Ori =< 4,Orientacao is Ori);
					(Ori >= 6,Orientacao is Ori + 1)),
			(valida_orientacaoPossivel(Board, X, Y, Orientacao, Player)),
			write('Orientacao: '),write(Ori), nl.

get_numeroCasas_Bot(Board, X,Y, NcasasPossiveis,NcasasEscolhidas,Jogador, Orientacao) :-
				repeat,	% Ciclo para pedir quantas casas quer mexer
								once(get_numeroCasas(Board, X, Y, NcasasPossiveis)),
								once(random(0,NcasasPossiveis+1, Ncasas)),
								write('Numero de casas: '), write(Ncasas), nl,
								NcasasEscolhidas is Ncasas,
				valida_NcasasUtilizador(NcasasPossiveis, NcasasEscolhidas),
				repeat,	% 	Ciclo para pedir a orientação para onde vai mover a peça
								once(read_orientacao(Orientacao, NcasasPossiveis, NcasasEscolhidas)),
				(valida_orientacaoPossivel(Board, X, Y, Orientacao, Jogador)).

ask_NumeroCasas(Board, X, Y, NcasasPossiveis, NcasasEscolhidas,Jogador, Orientacao) :-
				repeat,	% Ciclo para pedir quantas casas quer mexer
								once(get_numeroCasas(Board, X, Y, NcasasPossiveis)),
								once(read_NumeroCasas(NcasasPossiveis, NcasasEscolhidas)),
				valida_NcasasUtilizador(NcasasPossiveis, NcasasEscolhidas),
				repeat,	% 	Ciclo para pedir a orientação para onde vai mover a peça
								once(read_orientacao(Orientacao, NcasasPossiveis, NcasasEscolhidas)),
				(valida_orientacaoPossivel(Board, X, Y, Orientacao, Jogador)).

%				Quando escolhe fazer rotação
jogada_rotacao(Board, X, Y,Jogador, NovoBoard, IdPeca,ModoJogo) :-
					IdPeca is 1,
					((Jogador =:= 1,ModoJogo =\=3, get_sentido_humano(Sentido));
					 (Jogador =:= 2, ModoJogo =:= 2, get_sentido_Bot(Sentido);
					 (ModoJogo =:= 3, get_sentido_Bot(Sentido)))),
					rodar_peca(Board, X, Y, Sentido, NovoBoard).

get_sentido_humano(Sentido):-
		repeat,	% Ciclo que vai ler o sentido em que quer rodar (Esquerda/Direita)
								once(read_rotacao(Sentido)),
					valida_rotacao(Sentido).

get_sentido_Bot(Sentido) :-
		repeat,
			once(random(0,2,Sentido)),
		valida_rotacao(Sentido).


%				Quando escolhe fazer um movimento
jogada_movimento(Board, X, Y, Player, NovoBoard, IdPeca, NcasasEscolhidas, Orientacao) :-
					mover_peca(Board, X, Y, Orientacao, Player, NovoBoard, NcasasEscolhidas, IdPeca).

valida_orientacaoPossivel(Board, X, Y, Orientacao, Jogador) :-
					((valida_orientacao(Orientacao)),
					(verificar_bitOrientacao(Board, X, Y, Orientacao, Jogador))).

atualiza_jogador(Player) :-
					((Player =:= 1, assert(player(2)));
					(Player =:= 2, assert(player(1)))).

fim_deJogo(IdPeca) :-
					IdPeca = 4.
