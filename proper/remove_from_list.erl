-module(remove_from_list).
-include_lib("proper/include/proper.hrl").
-include_lib("eunit/include/eunit.hrl").
-compile(export_all).


remove_from_list(Needle, [Needle| Haystack]) ->
    Haystack;
remove_from_list(Needle, [First | Haystack]) ->
    [First| remove_from_list(Needle, Haystack)];
remove_from_list(_, []) ->
    [].
    


prop_not_in_list() ->
    ?FORALL({El, List},
            {integer(), list(integer())},
            not(lists:member(El, remove_from_list(El, List)))).
            
