module System._Class.OperationCanceledException;

static import System.Threading;

import System;
import System.Runtime.Serialization;


public class OperationCanceledException : SystemException
{
	private System.Threading.CancellationToken _cancellationToken;

	@property System.Threading.CancellationToken CancellationToken()
	{
		return _cancellationToken;
	}

	@property void CancellationToken(System.Threading.CancellationToken value)
	{
		_cancellationToken = value;
	}

	public this()
	{
		super(Environment.GetResourceString("OperationCanceled"));
		SetErrorCode(__HResults.E_POINTER);
	}
	
	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.E_POINTER);
	}
	
	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.E_POINTER);
	}

	public this(System.Threading.CancellationToken token)
	{
		super();
		_cancellationToken = token;
	}

	public this(string message, System.Threading.CancellationToken token)
	{
		super(message);
		_cancellationToken = token;
	}

	public this(string message, Exception innerException, System.Threading.CancellationToken token)
	{
		super(message, innerException);
		_cancellationToken = token;
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}