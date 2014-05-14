module System.Threading;


public import System.Threading._Class.ThreadAbortException;
public import System.Threading._Class.ThreadStartException;
public import System.Threading._Class.ThreadStateException;
public import System.Threading._Class.SemaphoreFullException;
public import System.Threading._Class.ThreadInterruptedException;
public import System.Threading._Class.SynchronizationLockException;

class Thread
{
	@property public static Thread CurrentThread() { assert(0); }
	@property Object AbortReason() { assert(0); }
}

public struct CancellationToken
{}