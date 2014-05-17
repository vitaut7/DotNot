module System._Class.Char;

import System;


class Char
{
	public static const MaxValue = 123;
	public static const MinValue = 0;

	alias Value this;
	private char _value;
	
	@property char Value()
	{
		return _value;
	}
	
	@property void Value(char value)
	{
		_value = value;
	}
	
	static Char opCall(char value) { return new Char(); }
	float ToFloat(IFormatProvider p = null) { return 123.123; }
	double ToDouble(IFormatProvider p = null) { return 123.123; }
	real ToReal(IFormatProvider p = null) { return 123.123; }
	
	DateTime ToDateTime(IFormatProvider p = null) { return null; }
	
	public static bool IsWhiteSpace(char c) { return false; }
}