-module(cclient).
-export([main/0, loop/1]).

main() ->
    {ok, Context} = erlzmq:context(),
    {ok, Socket} = erlzmq:socket(Context, req),
    ok = erlzmq:connect(Socket, "ipc://test_hello"),
    loop(Socket).

loop(Socket) ->
    erlzmq:send(Socket, <<"this client sent">>),   
    {ok, Recv} = erlzmq:recv(Socket), 
    io:format("recv msg: ~s", [Recv]),
    timer:sleep(1000),
    loop(Socket).
