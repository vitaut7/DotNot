module System.Reflection._Interface.ICustomAttributeProvider;

import System;


public interface ICustomAttributeProvider
{
	Object[] GetCustomAttributes(Type attributeType, bool inherit);
	Object[] GetCustomAttributes(bool inherit);
	bool IsDefined (Type attributeType, bool inherit);
}