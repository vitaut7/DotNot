module System._Class.Type;

import System;


public abstract class Type
{
	@internal static RuntimeType GetTypeFromHandleUnsafe(IntPtr handle) { return new RuntimeType();} // TODO extern

}