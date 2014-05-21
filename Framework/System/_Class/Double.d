module System._Class.Double;

import System;
import System.Globalization;


public final class Double : IConvertible, IFormattable, IComparable!double, IEquatable!double {
	alias opEquals = Equals;
	alias opCmp = CompareTo;
	public static const double MinValue = -1.7976931348623157e+308;
	public static const double MaxValue = 1.7976931348623157e+308;
	public static const double Epsilon = 4.9406564584124654e-324;
	public static const double PositiveInfinity = cast(double)1.0 / cast(double)0.0;
	public static const double NegativeInfinity = cast(double)-1.0 / cast(double)0.0;
	public static const double NaN = cast(double)0.0 / cast(double)0.0;
	//@internal static double NegativeZero = BitConverter.Int64BitsToDouble(cast(long)0x8000000000000000);
	
	alias Value this;
	private double _value;
	
	@property double Value() {
		return _value;
	}
	
	@property void Value(double value) {
		_value = value;
	}
	
	static Double opCall(double value) {
		Double ret = new Double();
		ret._value = value;
		return ret;
	}
	
	public static double Parse(string s) {
		return Parse(s, NumberStyles.Float | NumberStyles.AllowThousands, NumberFormatInfo.CurrentInfo);
	}
	
	public static float Parse(string s, NumberStyles style) {
		NumberFormatInfo.ValidateParseStyleFloatingPoint(style);
		return Parse(s, style, NumberFormatInfo.CurrentInfo);
	}
	
	public static float Parse(string s, IFormatProvider provider) {
		return Parse(s, NumberStyles.Float | NumberStyles.AllowThousands, NumberFormatInfo.GetInstance(provider));
	}
	
	public static float Parse(string s, NumberStyles style, IFormatProvider provider) {
		NumberFormatInfo.ValidateParseStyleFloatingPoint(style);
		return Parse(s, style, NumberFormatInfo.GetInstance(provider));
	}
	
	private static float Parse(string s, NumberStyles style, NumberFormatInfo info) {
		return Number.ParseDouble(s, style, info);
	}
	
	public static bool TryParse(string s, out double result) {
		return TryParse(s, NumberStyles.Float | NumberStyles.AllowThousands, NumberFormatInfo.CurrentInfo, result);
	}
	
	public static bool TryParse(string s, NumberStyles style, IFormatProvider provider, out double result) {
		NumberFormatInfo.ValidateParseStyleFloatingPoint(style);
		return TryParse(s, style, NumberFormatInfo.GetInstance(provider), result);
	}
	
	private static bool TryParse(string s, NumberStyles style, NumberFormatInfo info, out double result) {
		if (!s) {
			result = 0;
			return false;
		}
		
		if (Number.TryParseDouble(s, style, info, result)) {
			string trim = s.Trim();
			if (trim == info.PositiveInfinitySymbol)
				result = PositiveInfinity;
			else if (trim == info.NegativeInfinitySymbol)
				result = NegativeInfinity;
			else if (trim == info.NaNSymbol)
				result = NaN;
			else
				return false;
		}
		
		return true;
	}
	
	private this() {
	}
	
	public static bool IsInfinity(double d) {
		return (*cast(long *)(&d) & 0x7FFFFFFFFFFFFFFF) == 0x7FF0000000000000;
	}
	
	public static bool IsPositiveInfinity(double d) {
		return d == PositiveInfinity;
	}
	
	public static bool IsNegativeInfinity(double d) {
		return d == NegativeInfinity;
	}

	@internal static bool IsNegative(double d) {
		return (*cast(ulong *)(&d) & 0x8000000000000000) == 0x8000000000000000;
	}
	
	public static bool IsNaN(double d) {
		return (*cast(ulong *)(&d) & 0x7FFFFFFFFFFFFFFFL) > 0x7FF0000000000000L;
	}
	
	// Override Objct's methods
	public override int GetHashCode() {
		double d = _value;
		if(!d)
			return 0;
		
		long v = *cast(long *)(&d);
		return cast(int)v ^ cast(int)(v >> 32);
	}
	
	public override bool Equals(Object obj) {
		if (obj.GetType() != Double.GetType())
			return false;
		
		double tmp = (cast(Double)obj)._value;
		if (tmp == _value)
			return true;
		
		return IsNaN(tmp) && IsNaN(_value);
	}
	
	// Implement interface methods
	public bool Equals(double other) {
		if (_value == other)
			return true;
		
		return IsNaN(other) && IsNaN(_value);
	}
	
	public int CompareTo(double value) {
		if (_value < value) return -1;
		if (_value > value) return 1;
		if (_value == value) return 0;
		
		if (IsNaN(_value))
			return IsNaN(value) ? 0 : -1;
		return 1;
	}
	
	TypeCode GetTypeCode() {
		return TypeCode.Double;
	}
	
	bool ToBoolean(IFormatProvider provider = null) {
		return Convert.ToBoolean(_value);
	}
	
	char ToChar(IFormatProvider provider = null) {
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Double", "Char"));
	}
	
	byte ToByte(IFormatProvider provider = null) {
		return Convert.ToByte(_value);
	}
	
	ubyte ToUByte(IFormatProvider provider = null) {
		return Convert.ToUByte(_value);
	}
	
	short ToInt16(IFormatProvider provider = null) {
		return Convert.ToInt16(_value);
	}
	
	ushort ToUInt16(IFormatProvider provider = null) {
		return Convert.ToUInt16(_value);
	}
	
	int ToInt32(IFormatProvider provider = null) {
		return Convert.ToInt32(_value);
	}
	
	uint ToUInt32(IFormatProvider provider = null) {
		return Convert.ToUInt32(_value);
	}
	
	long ToInt64(IFormatProvider provider = null) {
		return Convert.ToInt64(_value);
	}
	
	ulong ToUInt64(IFormatProvider provider = null) {
		return Convert.ToUInt64(_value);
	}
	
	float ToFloat(IFormatProvider provider = null) {
		return Convert.ToFloat(_value);
	}
	
	double ToDouble(IFormatProvider provider = null) {
		return _value;
	}
	
	real ToReal(IFormatProvider provider = null) {
		return Convert.ToReal(_value);
	}
	
	DateTime ToDateTime(IFormatProvider provider = null) {
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Double", "DateTime"));
	}
	
	string ToString(IFormatProvider provider = null) out (result) {
		assert(result);
	} body {
		return Number.FormatDouble(_value, null, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	string ToString(string format, IFormatProvider provider = null) out (result) {
		assert(result);
	} body {
		return Number.FormatDouble(_value, format, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	Object ToType(Type conversionType, IFormatProvider provider = null) {
		return Convert.DefaultToType(this, conversionType, provider);
	}
}