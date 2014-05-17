module System._Class.Real;

import System;


class Real
{
	alias Value this;
	private real _value;
	
	@property real Value()
	{
		return _value;
	}
	
	@property void Value(real value)
	{
		_value = value;
	}

	static Real opCall(real value) { return new Real(); }
	char ToChar(IFormatProvider p = null) { return 'a'; }
	DateTime ToDateTime(IFormatProvider p = null) { return null; }
}