%     Predicado responsavel por econtrar o comandante adversário
get_ComandanteAdversario(Board, Jogador, NumeroColunas, NumeroLinhas, Xcomandante, Ycomandante, IdPeca) :-
  get_sentido(Jogador, Sentido, NumeroColunas, NumeroLinhas, Xinicio, Yinicio),
  nl,nl,nl,write(Sentido),nl,write(Xinicio),nl,write(Yinicio),nl,
  get_bitPeca(Board, Xinicio, Yinicio, 0, Peca),
  convertComando(Peca, _IdPecaComandante),

  get_bitPeca(Board, Xinicio, Yinicio, 5, IDJog),
  convertPlayer(IDJog, IDJogador),
  %write('IDJOGADOR'), write(IDJogador), nl, write(Jogador),nl,
  (
    (
      (IDJogador =:= Jogador),
      Xcomandante is Xinicio,
      Ycomandante is Yinicio,
      write(Xcomandante),nl,write(Ycomandante),nl,
      get_casa(Board, Xcomandante, Ycomandante, Casa),
      write(Casa),nl
    );
    (
      (
        Sentido =:= 0,
        (Yinicio >= 0,
          (
            (
              Xinicio =:= 0,
              X is 16,
              Y is Yinicio-2,
              read(_A)
            );
            (
              Xinicio >= 2,
              X is Xinicio-2,
              Y is Yinicio
            )
          ),
          IdPeca is 1,
          get_casa(Board, Xcomandante, Ycomandante, Casa),
          write(Casa),nl,
          get_ComandanteAdversario(Board, Jogador, X, Y, Xcomandante, Ycomandante, IdPeca))
      );
      (
        Sentido =:= 1,
        (Yinicio =< 16,
          (
            (
              Xinicio =:= 16,
              X is 0,
              Y is Yinicio+2
            );
            (
              Xinicio =< 14,
              X is Xinicio+2,
              Y is Yinicio
            )
          ),
          IdPeca is 1,
          get_ComandanteAdversario(Board, Jogador, X, Y, Xcomandante, Ycomandante, IdPeca))
      )
    )).

get_sentido(Jogador, Sentido, NumeroColunas, NumeroLinhas, Xinicio, Yinicio) :-
      (
        (Jogador =:= 1, Sentido is 0, Xinicio is NumeroColunas, Yinicio is NumeroLinhas);
        (Jogador =:= 2, Sentido is 1, Xinicio is 0, Yinicio is 0)
      ).

gera_peca(Board, Jogador, X, Y) :-
      repeat,
            once(create_coordenadas_bot(X,Y)),
            once(get_bitPeca(Board, X, Y, 5, Bit)),
            once(convertPlayer(Bit, P)),
      valida_escolhaPeca(X, Y, Jogador, P).
