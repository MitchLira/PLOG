begin_message :-
            format('--------___________________---------- ~n',[]),
            format('-------|                   |--------- ~n',[]),
            format('-------|  Ploy Board Game  |--------- ~n',[]),
            format('-------|___________________|--------- ~n',[]).

mensagem_vencedor(Player) :-
            write('--------__________________________---------'),nl,
            write('-------|                          |---------'),nl,
            write('-------|  Player '),write(Player),write(' is the winner! |---------'),nl,
            write('-------|__________________________|---------'),nl.

menu_inicial(ModoJogo) :-
            nl, nl, begin_message, nl, nl,
            repeat,
            menu_modes(ModoJogo),
            valida_ModoJogo(ModoJogo).

menu_modes(ModoJogo) :-
            write('Choose the game mode:\n'),
            write('Mode 1 - Player vs Player\n'),
            write('Mode 2 - Player vs Bot\n'),
            write('Mode 3 - Bot vs Bot\n'),
            read(ModoJogo).

menu_mensagemVitoria(Player) :-
            mensagem_vencedor(Player).

menu_turnoJogador(Player) :-
            write('------------------ Player '), write(Player), write(' turn --------------------\n').

%           Verifica se modo de jogo é correto
valida_ModoJogo(ModoJogo) :-
            (ModoJogo =:= 1);
            (ModoJogo =:= 2);
            (ModoJogo =:= 3).

%            Mensagem de erro para quando introduz modo de jogo errado
valida_ModoJogo(_) :-
            write('\nEnter the write game mode! (1, 2 or 3)\n'),
            fail.
