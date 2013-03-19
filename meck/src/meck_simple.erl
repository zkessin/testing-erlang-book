-module(meck_simple).
-include_lib("eunit/include/eunit.hrl").
process_post_test_() ->
    {
      setup,
      fun () ->
	      meck:new(wrq)
      end,
      fun (_) ->
	      meck:unload(wrq)
      end,
      ?_test(
	 begin

	     meck:expect(wrq,
		req_body,
		fun(_) ->
			<<"Test Content Body">>
		end)
	     %% Test something here
	     %% ... 
	 end)}.
