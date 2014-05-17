module System._Class.Float;

import System;


class Float //TODO
{
	alias Value this;
	private float _value;
	
	@property float Value()
	{
		return _value;
	}
	
	@property void Value(float value)
	{
		_value = value;
	}

	static Float opCall(float value) { return new Float(); }
	char ToChar(IFormatProvider p = null) { return 'a'; }
	DateTime ToDateTime(IFormatProvider p = null) { return null; }
}