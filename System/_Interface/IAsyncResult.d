module System._Interface.IAsyncResult;


public interface IAsyncResult
{
	@property
	{
		Object Asyncstate();
		//WaitHandle AsyncWaitHandle();
		bool CompletedSynchronously();
		bool IsCompleted();
	}
}