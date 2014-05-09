module System._Interface.ICustomFormatter;

import System;


public interface ICustomFormatter
{
	string Format(string format, Object arg, IFormatProvider formatProvider);
}