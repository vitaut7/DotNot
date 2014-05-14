module System._Class.EventArgs;


public class EventArgs
{
	public static immutable(EventArgs) Empty = cast(immutable(EventArgs))new EventArgs();


	public this()
	{
	}
}