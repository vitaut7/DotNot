module System._Class.UnhandledExceptionEventArgs;

import System;


public class UnhandledExceptionEventArgs : EventArgs
{
	private Object _exception;
	private bool _isTerminating;

	@property public Object ExceptionObject()
	{
		return _exception;
	}

	@property public bool IsTerminating()
	{
		return _isTerminating;
	}

	public this(Object exception, bool isTerminating)
	{
		_exception = exception;
		_isTerminating = isTerminating;
	}
}