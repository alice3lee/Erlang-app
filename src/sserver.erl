-module(sserver).
-export([main/0, loop/1]).

main() ->
    application:start(chumak),
    {ok, Socket} = chumak:socket(rep, "rep"),
    {ok, _BindPid} = chumak:bind(Socket, tcp, "localhost", 8080),
    loop(Socket).

loop(Socket) ->
    {ok, Recv} = chumak:recv(Socket),
    io:format("Message: ~p\n",[Recv]),   
    chumak:send(Socket, "This send server"),    
    timer:sleep(1000),
    loop(Socket).
