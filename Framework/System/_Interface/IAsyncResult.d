module System._Interface.IAsyncResult;

import System;


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