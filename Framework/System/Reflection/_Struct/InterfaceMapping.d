module System.Reflection._Struct.InterfaceMapping;

import System;
import System.Reflection;


public struct InterfaceMapping
{
	public Type TargetType;
	public Type InterfaceType;
	public MethodInfo[] TargetMethods;
	public MethodInfo[] InterfaceMethods;
}