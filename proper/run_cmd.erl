-module(run_cmd).
-compile(export_all).

command(Cmd) ->
     Opt = [stream, exit_status, use_stdio,
            stderr_to_stdout, in, eof],
     P = open_port({spawn, Cmd}, Opt),
     get_data(P, []).

get_data(P, D) ->
     receive
         {P, {data, D1}} ->
             get_data(P, [D|D1]);
         {P, eof} ->
             port_close(P),
             receive
                 {P, {exit_status, N}} ->
                     {N, lists:reverse(D)}
             end
     end.
