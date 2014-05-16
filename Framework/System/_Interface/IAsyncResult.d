module System._Interface.IAsyncResult;

import System;
import System.Threading;


public interface IAsyncResult
{
	@property
	{
		Object Asyncstate();
		WaitHandle AsyncWaitHandle();
		bool CompletedSynchronously();
		bool IsCompleted();
	}
}