module System._Class.UInt16;

import System;
import System.Globalization;


public final class UInt16 : IConvertible, IFormattable, IComparable!ushort, IEquatable!ushort {
	alias opEquals = Equals;
	alias opCmp = CompareTo;
	public static const MaxValue = cast(short)0xFFFF;
	public static const MinValue = cast(short)0x0000;
	
	alias Value this;
	private ushort _value;

	@property ushort Value() {
		return _value;
	}
	
	@property void Value(ushort value) {
		_value = value;
	}
	
	static UInt16 opCall(ushort value) {
		UInt16 ret = new UInt16();
		ret._value = value;
		return ret;
	}

	public static ushort Parse(string s) {
		return Parse(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo);
	}
	
	public static ushort Parse(string s, NumberStyles style) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Parse(s, style, NumberFormatInfo.CurrentInfo);
	}
	
	public static ushort Parse(string s, IFormatProvider provider) {
		return Parse(s, NumberStyles.Integer, NumberFormatInfo.GetInstance(provider));
	}
	
	public static ushort Parse(string s, NumberStyles style, IFormatProvider provider) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Parse(s, style, NumberFormatInfo.GetInstance(provider));
	}
	
	private static ushort Parse(string s, NumberStyles style, NumberFormatInfo info) {
		int i;
		
		try {
			i = Number.ParseInt32(s, style, info);
		}
		catch (OverflowException e) {
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt16"), e);
		}
		
		if (i < MinValue || i > MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt16"));
		
		return cast(ushort)i;
	}
	
	public static bool TryParse(string s, out ushort result) {
		return TryParse(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo, result);
	}
	
	public static bool TryParse(string s, NumberStyles style, IFormatProvider provider, out ushort result) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return TryParse(s, style, NumberFormatInfo.GetInstance(provider), result);
	}
	
	private static bool TryParse(string s, NumberStyles style, NumberFormatInfo info, out ushort result) {
		result = 0;
		int i;
		
		if (!Number.TryParseInt32(s, style, info, i))
			return false;
		
		if (i < MinValue || i > MaxValue)
			return false;
		
		result = cast(ushort)i;
		return true;
	}
	
	private this() {
	}
	
	// Override Objct's methods
	public override int GetHashCode() {
		return _value;
	}
	
	public override bool Equals(Object obj) {
		if (obj.GetType() != UInt16.GetType())
			return false;
		
		return (cast(UInt16)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(ushort other) {
		return _value == other;
	}
	
	public int CompareTo(ushort value) {
		return _value - value;
	}
	
	TypeCode GetTypeCode() {
		return TypeCode.UInt16;
	}
	
	bool ToBoolean(IFormatProvider provider = null) {
		return Convert.ToBoolean(_value);
	}
	
	char ToChar(IFormatProvider provider = null) {
		return Convert.ToChar(_value);
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
		return _value;
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
		return Convert.ToDouble(_value);
	}
	
	real ToReal(IFormatProvider provider = null) {
		return Convert.ToReal(_value);
	}
	
	DateTime ToDateTime(IFormatProvider provider = null) {
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "UInt16", "DateTime"));
	}
	
	string ToString(IFormatProvider provider = null) out (result) {
		assert(result);
	} body {
		return Number.FormatUInt32(_value, null, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	string ToString(string format, IFormatProvider provider = null) out (result) {
		assert(result);
	} body {
		return Number.FormatUInt32(_value, format, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	Object ToType(Type conversionType, IFormatProvider provider = null) {
		return Convert.DefaultToType(this, conversionType, provider);
	}
}