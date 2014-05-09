module System._Interface.IFormatProvider;

import System;


public interface IFormatProvider
{
	Object GetFormat(Type formatType);
}