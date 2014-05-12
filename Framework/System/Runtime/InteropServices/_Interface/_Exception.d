module System.Runtime.InteropServices._Interface._Exception;

import System;
import System.Reflection;


public interface _Exception
{
	@property
	{
		public string Message();
		public string StackTrace();

		public string HelpLink();
		public void HelpLink(string);

		public string Source();
		public void Source(string);

		public Exception InnerException();
		public MethodBase TargetSite();
	}

	public Exception GetBaseException();
}