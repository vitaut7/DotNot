module System._Class.Real;

import System;
import System.Globalization;

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
	public static real Parse(string s, NumberStyles style, IFormatProvider provider) { assert(0); }
}

/*
module System._Class.Real;

import System;
import System.Globalization;


public final class Real : IConvertible, IFormattable, IComparable!real, IEquatable!real
{
alias opEquals = Equals;
	alias opCmp = CompareTo;
	public static const real MinValue = -3.40282346638528859e+38;
	public static const real MaxValue = 79228162514264337593543950335m;
	public static const real Epsilon = 1.4e-45;
	public static const real PositiveInfinity = cast(real)1.0 / cast(real)0.0;
	public static const real NegativeInfinity = cast(real)-1.0 / cast(real)0.0;
	public static const real NaN = cast(real)0.0 / cast(real)0.0;
	
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
	
	static Real opCall(real value)
	{
		Real ret = new Real();
		ret._value = value;
		return ret;
	}
	
	public static real Parse(string s)
	{
		return Parse(s, NumberStyles.Float | NumberStyles.AllowThousands, NumberFormatInfo.CurrentInfo);
	}
	
	public static real Parse(string s, NumberStyles style)
	{
		NumberFormatInfo.ValidateParseStyleFloatingPoint(style);
		return Parse(s, style, NumberFormatInfo.CurrentInfo);
	}
	
	public static real Parse(string s, IFormatProvider provider)
	{
		return Parse(s, NumberStyles.Float | NumberStyles.AllowThousands, NumberFormatInfo.GetInstance(provider));
	}
	
	public static real Parse(string s, NumberStyles style, IFormatProvider provider)
	{
		NumberFormatInfo.ValidateParseStyleFloatingPoint(style);
		return Parse(s, style, NumberFormatInfo.GetInstance(provider));
	}
	
	private static real Parse(string s, NumberStyles style, NumberFormatInfo info)
	{
		return Number.ParseFloat(s, style, info);
	}
	
	public static bool TryParse(string s, out real result)
	{
		return TryParse(s, NumberStyles.Float | NumberStyles.AllowThousands, NumberFormatInfo.CurrentInfo, result);
	}
	
	public static bool TryParse(string s, NumberStyles style, IFormatProvider provider, out real result)
	{
		NumberFormatInfo.ValidateParseStyleFloatingPoint(style);
		return TryParse(s, style, NumberFormatInfo.GetInstance(provider), result);
	}
	
	private static bool TryParse(string s, NumberStyles style, NumberFormatInfo info, out real result)
	{
		if (!s)
		{
			result = 0;
			return false;
		}
		
		if (Number.TryParseFloat(s, style, info, result))
		{
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
	
	private this()
	{
	}
	
	public static bool IsInfinity(float f)
	{
		return (*cast(int *)(&f) & 0x7FFFFFFF) == 0x7F800000;
	}
	
	public static bool IsPositiveInfinity(float f)
	{
		return *cast(int *)(&f) == 0x7F800000;
	}
	
	public static bool IsNegativeInfinity(float f)
	{
		return *cast(int *)(&f) == cast(int)0xFF800000;
	}
	
	public static bool IsNaN(float f)
	{
		return (*cast(int *)(&f) & 0x7FFFFFFF) > 0x7F800000;
	}
	
	// Override Objct's methods
	public override int GetHashCode()
	{
		float f = _value;
		if(!f)
			return 0;
		
		int v = *cast(int *)(&f);
		return v;
	}
	
	public override bool Equals(Object obj)
	{
		if (obj.GetType() != Float.GetType())
			return false;
		
		float tmp = (cast(Float)obj)._value;
		if (tmp == _value)
			return true;
		
		return IsNaN(tmp) && IsNaN(_value);
	}
	
	// Implement interface methods
	public bool Equals(float other)
	{
		if (_value == other)
			return true;
		
		return IsNaN(other) && IsNaN(_value);
	}
	
	public int CompareTo(float value)
	{
		if (_value < value) return -1;
		if (_value > value) return 1;
		if (_value == value) return 0;
		
		if (IsNaN(_value))
			return IsNaN(value) ? 0 : -1;
		return 1;
	}
	
	TypeCode GetTypeCode()
	{
		return TypeCode.Float;
	}
	
	bool ToBoolean(IFormatProvider provider = null)
	{
		return Convert.ToBoolean(_value);
	}
	
	char ToChar(IFormatProvider provider = null)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Float", "Char"));
	}
	
	byte ToByte(IFormatProvider provider = null)
	{
		return Convert.ToByte(_value);
	}
	
	ubyte ToUByte(IFormatProvider provider = null)
	{
		return Convert.ToUByte(_value);
	}
	
	short ToInt16(IFormatProvider provider = null)
	{
		return Convert.ToInt16(_value);
	}
	
	ushort ToUInt16(IFormatProvider provider = null)
	{
		return Convert.ToUInt16(_value);
	}
	
	int ToInt32(IFormatProvider provider = null)
	{
		return Convert.ToInt32(_value);
	}
	
	uint ToUInt32(IFormatProvider provider = null)
	{
		return Convert.ToUInt32(_value);
	}
	
	long ToInt64(IFormatProvider provider = null)
	{
		return Convert.ToInt64(_value);
	}
	
	ulong ToUInt64(IFormatProvider provider = null)
	{
		return Convert.ToUInt64(_value);
	}
	
	float ToFloat(IFormatProvider provider = null)
	{
		return _value;
	}
	
	double ToDouble(IFormatProvider provider = null)
	{
		return Convert.ToDouble(_value);
	}
	
	real ToReal(IFormatProvider provider = null)
	{
		return Convert.ToReal(_value);
	}
	
	DateTime ToDateTime(IFormatProvider provider = null)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Float", "DateTime"));
	}
	
	string ToString(IFormatProvider provider = null)
	{
		Contract.Ensures(Contract.Result!string() !is null);
		return Number.FormatFloat(_value, null, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	string ToString(string format, IFormatProvider provider = null)
	{
		Contract.Ensures(Contract.Result!string() !is null);
		return Number.FormatFloat(_value, format, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	Object ToType(Type conversionType, IFormatProvider provider = null)
	{
		return Convert.DefaultToType(this, conversionType, provider);
	}
}
 */