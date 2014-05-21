module System._Interface.IAsyncResult;

import System;
import System.Threading;


public interface IAsyncResult {
	@property Object Asyncstate();
	@property WaitHandle AsyncWaitHandle();
	@property bool CompletedSynchronously();
	@property bool IsCompleted();
}