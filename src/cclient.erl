-module(cclient).
-export([main/0, loop/1]).

main() ->
    application:start(chumak),
    {ok, Socket} = chumak:socket(req, "req"),
    chumak:connect(Socket, tcp, "localhost", 8080),
    loop(Socket).

loop(Socket) ->
    chumak:send(Socket, "This send client"),
    {ok, Recv} = chumak:recv(Socket), 
    io:format("Message: ~p\n", [Recv]),
    timer:sleep(1000),
    loop(Socket).
