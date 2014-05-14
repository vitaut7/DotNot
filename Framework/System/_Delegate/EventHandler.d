module System._Delegate.EventHandler;

import System;


alias Event!(Object, EventArgs) EventHandler;

template EventHandlerT(TEventArgs)
{
	alias Event!(Object, TEventArgs) EventHandlerT;
}