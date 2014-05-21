module System._Interface.IFormattable;

import System;


public interface IFormattable {
	string ToString(string format, IFormatProvider formatProvider = null);
}