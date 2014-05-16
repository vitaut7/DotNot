module System.Reflection._Interface.ComInterfaces;

import System;

public interface _Type
{
	void GetTypeInfo(out uint info);
	void GetTypeInfo(uint info, uint id, IntPtr ptrInfo);
	//void GetIDsOfNames(ref )
}