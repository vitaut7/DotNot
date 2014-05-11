module System.Threading._Class.ThreadAbortException;

import System;


public final class ThreadAbortException : SystemException
{
	@property
	{
		public Object ExceptionState() { return null; }// TODO : Thread.CurrentThread.AbortReason;
	}


	public this()
	{
		super("TODO");/*GetMessageFromNativeResources(ExceptionMessageKind.ThreadAbort)*/ //TODO
		SetErrorCode(__HResults.COR_E_THREADABORTED);
	}

	@internal public this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}