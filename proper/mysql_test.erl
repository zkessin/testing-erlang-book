-module(mysql_test).
-compile(export_all).
-include("deps/proper/include/proper.hrl").



runp() ->
    runp(100).

runp(N) ->
    proper:quickcheck(prop_postgres_update_round_trip(),[N]),
    ok.

-type ascii_char() ::32..126.
prop_postgres_round_trip() ->
    ?FORALL({Text, Integer, Bool, Float, Date,Bytea},
            {list(ascii_char()),
             integer(),
             boolean(),
             float(),
             date(),binary()},
            ?IMPLIES(calendar:valid_date(Date),
                     ?IMPLIES(length(Text) > 1,
                              begin
                                  test_round_trip({tb(Text),Integer, Bool, Float, Date, Bytea})
                              end))).
test_round_trip({Text,Integer, Bool, Float, Date, Bytea}) ->
    Rec        = db_test:new(id, Text, Integer, Bool, Float, Date, Bytea),
    
    {ok, Rec2} = Rec:save(),
    
    [R|_]      = boss_db:find(db_test, [{text, 'equals', Text}]),
    io:format( "<-- ~p~n--> ~p~n~n",[Rec2, R]),
    
    Res = all([
               R:id()         =:= Rec2:id(),
               tb(R:text())   =:= tb(Rec:text()),
               R:integer()    =:= Rec:integer(),
               cb(R:bool())   =:= Rec:bool(),
               1.0* R:float() =:= Rec:float(),
               R:date()       =:= {date,Rec:date()},
               R:bytea()      =:= Rec:bytea()]),
    boss_db:delete(Rec2:id()),    
    Res.

cb(0) ->
    false;
cb(_) ->
    true.

all(L) ->
    lists:all(fun(X) ->
                      X
              end, L).

tb(X) when is_list(X) ->
    list_to_binary(X);
tb(X) when is_binary(X) ->
    X.
