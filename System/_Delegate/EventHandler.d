module System._Delegate.EventHandler;

import System;


template EventHandler()
{
	alias void delegate(Object sender, EventArgs e) EventHandler;
}

template EventHandler(TEventArgs)
{
	alias void delegate(Object sender, TEventArgs e) EventHandler;
}