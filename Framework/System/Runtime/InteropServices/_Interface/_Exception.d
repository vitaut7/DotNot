module System.Runtime.InteropServices._Interface._Exception;

import System;
import System.Reflection;


public interface _Exception
{
	@property public string Message();
	@property public string StackTrace();

	@property public string HelpLink();
	@property public void HelpLink(string);

	@property public string Source();
	@property public void Source(string);

	@property public Exception InnerException();
	@property public MethodBase TargetSite();

	public Exception GetBaseException();
}