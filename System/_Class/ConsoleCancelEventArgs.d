module System._Class.ConsoleCancelEventArgs;

import System;

alias void delegate(Object sender, ConsoleCancelEventArgs args) ConsoleCancelEventHandler;


public final class ConsoleCancelEventArgs : EventArgs
{
	private ConsoleSpecialKey _type;
	private bool _cancel;


	@property
	{
		public bool Cancel() { return _cancel; }
		public void Cancel(bool value) { _cancel = value; }

		public ConsoleSpecialKey SpecialKey() { return _type; }
	}


	this(ConsoleSpecialKey type)
	{
		_type = type;
		_cancel = false;
	}
}