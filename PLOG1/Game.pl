%Pr0jet0
:- use_module(library(lists)).
:- include('Board.pl').
:- include('Logic.pl').
:- include('Interface.pl').


% Implementação jogo



game:-
				board(Board),
				displayBoard(Board),
				read_coordenadas_casa(X,Y),
				read_rotacao(Ori),
				rodar_peca(Board, X, Y, Ori, NovoBoard),
				%numero_casas(Board, X, Y, NcasasPossiveis),
				%read_orientacao(Ori, NcasasPossiveis, NcasasEscolhidas),
				%mover_peca(Board, X, Y, Ori, NovoBoard, NcasasEscolhidas),
				displayBoard(NovoBoard).
