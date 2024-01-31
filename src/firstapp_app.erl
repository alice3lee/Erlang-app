%%%-------------------------------------------------------------------
%% @doc firstapp public API
%% @end
%%%-------------------------------------------------------------------

-module(firstapp_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    firstapp_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
