module System._Class.Type;

static import System.Reflection;

import System;


public abstract class Type
{
	@internal static RuntimeType GetTypeFromHandleUnsafe(IntPtr handle) { return new RuntimeType();} // TODO extern

	@property string FullName()
	{
		assert(0);
	}

	@property System.Reflection.Module Module()
	{
		assert(0);
	}

	@property System.Reflection.Assembly Assembly()
	{
		assert(0);
	}
}

template Typeof(T)
{
	auto Typeof = null;//typeid(T);
	//Typeof = null;
}