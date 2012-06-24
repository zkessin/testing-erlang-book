-module(eunit_cover).
-export([ cover/0]).

cover()->
    io:format("~n********************************************************************************~n"),
    io:format("Running Tests~n~n"),    

    cover:start(),
    _R			= cover:compile_beam_directory("ebin/"),
    
    Modules		= cover:modules(),
  
    [eunit:test(Module) || Module <- Modules],
    
    Coverage		= [cover:analyse(Module, calls, line) || Module <- Modules],
    L			= lists:merge([Lines || {ok, Lines} <- Coverage]),
    NonTestModules      = lists:filter(fun({{Module, _}, _} )->
						  Es = lists:reverse(string:tokens(atom_to_list(Module),"_") ),
						  lists:nth(1, Es)  =/= "test"
					  end,L),
    Zeros		= lists:filter(fun ({{_Module, _Line}, Count}) ->					       
					       Count	=:= 0
				       end, NonTestModules),
    [io:format("src/~p.erl:~p: No Code Coverage~n",[Module, Line])|| {{Module, Line}, 0} <-Zeros],
    io:format("~p Uncovered lines~n", [length(Zeros)]),
    init:stop().
    
    
    

