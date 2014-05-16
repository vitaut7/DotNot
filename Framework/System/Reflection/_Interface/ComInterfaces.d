module System.Reflection._Interface.ComInterfaces;

import System;

public interface _Type
{
	//region IDispatch
	void GetTypeInfo(out uint info);
	void GetTypeInfo(uint info, uint lcid, IntPtr ptrInfo);
	void GetIDsOfNames(ref Guid riid, IntPtr rgszNames, uint cNames, uint lcid, IntPtr rgDispId);
	//invoke


	//region Object
	string ToString();
	bool Equals(Object other);
	int GetHashCode();
	Type GetType();


}