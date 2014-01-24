-module(player).
-export([
         step/1,
         username/0,
         hostname/0
        ]).

username() ->
  "anatoli".
hostname() ->
  "localhost:8080".

step(Msg) ->
 Arr = utilities:process_msg(Msg),
 io:format("~p~n",[Arr]),
  "left=1".
