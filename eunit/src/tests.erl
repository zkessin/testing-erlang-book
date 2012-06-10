-module(tests). 
-export([run/0]).


run() ->
    io:format("Running Tests"),
    eunit:test("ebin/"),
    init:stop().

