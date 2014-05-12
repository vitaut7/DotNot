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


	public this(ConsoleSpecialKey type)
	{
		_type = type;
		_cancel = false;
	}
}


unittest
{
	ConsoleCancelEventArgs var = new ConsoleCancelEventArgs(ConsoleSpecialKey.ControlC);

	assert(var != EventArgs.Empty);
	assert(var.SpecialKey == ConsoleSpecialKey.ControlC);
}