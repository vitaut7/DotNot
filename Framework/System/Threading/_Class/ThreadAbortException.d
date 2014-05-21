module System.Threading._Class.ThreadAbortException;

import System;
import System.Threading;
import System.Runtime.Serialization;


public final class ThreadAbortException : SystemException {
	@property public Object ExceptionState() {
		return Thread.CurrentThread.AbortReason;
	}

	public this() {
		super(GetMessageFromNativeResources(ExceptionMessageKind.ThreadAbort));
		SetErrorCode(__HResults.COR_E_THREADABORTED);
	}

	@internal this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}