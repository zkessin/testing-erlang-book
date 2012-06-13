
do_something_with_fixtures_test_() ->
    {
      setup,
      fun setup/0,
      fun cleanup/1,
      ?_test(
	 begin
	     ?assertEqual(1, 2)
	 end)}.
