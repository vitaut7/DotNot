module System.Globalization;

public import System.Globalization._Enum.NumberStyles;

public import System.Globalization._Class.Calendar;


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

	@internal static void ValidateParseStyleFloatingPoint(NumberStyles style)
	{
		assert(0);
	}

	@property public string PositiveInfinitySymbol() { assert(0); }
	@property public string NegativeInfinitySymbol() { assert(0); }
	@property public string NaNSymbol() { assert(0); }
}