module System._Struct.RuntimeArgumentHandle;

import System;


public struct RuntimeArgumentHandle
{
	private IntPtr _ptr;

	@internal @property IntPtr Value()
	{
		return _ptr;
	}
}