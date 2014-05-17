module System._Class.Double;

import System;


class Double //TODO
{
	alias Value this;
	private double _value;
	
	@property double Value()
	{
		return _value;
	}
	
	@property void Value(double value)
	{
		_value = value;
	}

	static Double opCall(double value) { return new Double(); }
	char ToChar(IFormatProvider p = null) { return 'a'; }
	DateTime ToDateTime(IFormatProvider p = null) { return null; }
}