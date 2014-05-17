module System.Globalization;

public import System.Globalization._Enum.NumberStyles;


class NumberFormatInfo
{
	import System;
	public static NumberFormatInfo GetInstance(IFormatProvider formatProvider)
	{
		assert(0);
	}

	@internal static void ValidateParseStyleInteger(NumberStyles style)
	{
		assert(0);
	}

	@property public static NumberFormatInfo CurrentInfo()
	{
		assert(0);
	}
}