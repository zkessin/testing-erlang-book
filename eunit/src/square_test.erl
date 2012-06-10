-module(square_test).
-import_lib("eunit/include/eunit.hrl").

square_0_test() ->
    ?assertEqual(0, square:square(0)).

square_1_test() ->
    ?assertEqual(1, square:square(1)).

square_2_test() ->
    ?assertEqual(2, square:square(2)).

square_float_test() ->
    ?assertEqual(256.0, square:square(16.0)).


