-module(sserver).
-export([main/0, loop/1]).

main() ->
    {ok, Context} = erlzmq:context(),
    {ok, Socket} = erlzmq:socket(Context, rep),
    ok = erlzmq:bind(Socket, "ipc://test_hello"),
    loop(Socket).

loop(Socket) ->   
    {ok, Recv} = erlzmq:recv(Socket), 
    io:format("recv msg: ~s", [Recv]),
    erlzmq:send(Socket, <<"this server sent">>),
    timer:sleep(1000),
    loop(Socket).
