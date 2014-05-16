module System._Class.Real;

import System;


class Real
{
	static Real opCall(real value) { return new Real(); }
	char ToChar(IFormatProvider p = null) { return 'a'; }
	DateTime ToDateTime(IFormatProvider p = null) { return null; }
}