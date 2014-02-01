-module(ws_handler).

-behaviour(websocket_client_handler).
-export([
         start/0,
         init/2,
         websocket_info/3,
         websocket_handle/3,
         websocket_terminate/3
        ]).

-define(Host,'Elixir.Player':hostname()).
-define(User,'Elixir.Player':username()).

start() ->
  websocket_client:start_link("ws://"++ ?Host ++ "/tetris-contest/ws?user=" ++ ?User, ?MODULE, []).

init([], _ConnState) ->
    websocket_client:cast(self(), {text, <<"message 1">>}),
    {ok, 2}.

websocket_handle({text, Msg}, _ConnState, State) ->
    io:format("Received msg ~p~n", [Msg]),
    Step = list_to_binary('Elixir.Player':step(Msg)),
    {reply, {text, Step}, State}.

websocket_info(start, _ConnState, State) ->
    {reply, {text, <<"erlang message received">>}, State}.

websocket_terminate(Reason, _ConnState, State) ->
    io:format("Websocket closed in state ~p wih reason ~p~n",
              [State, Reason]),
    ok.
