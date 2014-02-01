.PHONY: all clean

all:
	mkdir -p ebin
	elixirc -o ebin -pa ebin lib/*.ex
	erlc -o ebin -pa ebin websocket_client/src/*.erl
	erlc -o ebin -pa ebin lib/ws_handler.erl

clean:
	rm -rf ebin
