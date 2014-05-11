module System._Delegate.EventHandler;

import System;


alias void delegate(Object sender, EventArgs e) EventHandler;

template EventHandlerT(TEventArgs)
{
	alias void delegate(Object sender, TEventArgs e) EventHandler;
}