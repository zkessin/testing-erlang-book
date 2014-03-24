-compile({parse_transform, ct_expand}).
-pt_pp_src(true).


words() ->
    {ok, Data} = file:read_file("/usr/share/dict/american-english"),
    binary:split(Data, <<"\n">>, [global]).

word_list() ->    
    ct_expand:term(words()).

passwd() ->
    oneof(word_list()).
