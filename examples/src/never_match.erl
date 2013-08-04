-module(never_match).
-compile(export_all).
-type component_id() ::binary().


-spec(get_component(component_id()) -> {ok,jsx:json_term()} | {error, not_found}).
get_component(Guid) ->
    {ok, [{<<"test">>, <<"test">>}]}.

-spec(get_json_from_guid(component_id()) -> {ok,jsx:json_text()} | {error, not_found}).
get_json_from_guid(Guid) ->
    case  get_component(Guid) of
	{ok, JSON} ->
	    {ok, jsx:to_json(JSON)};
	{error,not_found} ->
	    {error, not_found}
    end.
