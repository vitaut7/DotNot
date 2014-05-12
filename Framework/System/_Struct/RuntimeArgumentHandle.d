module System._Struct.RuntimeArgumentHandle;

import System;


public struct RuntimeArgumentHandle
{
	private IntPtr _ptr;


	@property
	{
		@internal IntPtr Value() { return _ptr; }
	}
}