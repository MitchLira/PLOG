menu_inicial(ModoJogo) :-
            nl, nl, begin_message, nl, nl,
            write('Choose the game mode:\n'),
            menu_modes(ModoJogo).


begin_message :-
            format('--------___________________---------- ~n',[]),
            format('-------|                   |--------- ~n',[]),
            format('-------|  Ploy Board Gam   |--------- ~n',[]),
            format('-------|___________________|--------- ~n',[]).

menu_modes(ModoJogo) :-
            write('Mode 1 - Play vs Play\n'),
            write('Mode 2 - Play vs Bot\n'),
            write('Mode 3 - Bot vs Bot\n'),
            read(ModoJogo).
