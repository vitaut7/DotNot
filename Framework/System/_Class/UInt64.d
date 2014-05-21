module System._Class.UInt64;

import System;
import System.Globalization;


public final class UInt64 : IConvertible, IFormattable, IComparable!ulong, IEquatable!ulong {
	alias opEquals = Equals;
	alias opCmp = CompareTo;
	public static const MaxValue = cast(int)0xffffffffffffffff;
	public static const MinValue = cast(int)0x0000000000000000;
	
	alias Value this;
	private ulong _value;

	@property ulong Value() {
		return _value;
	}
	
	@property void Value(ulong value) {
		_value = value;
	}
	
	static UInt64 opCall(ulong value) {
		UInt64 ret = new UInt64();
		ret._value = value;
		return ret;
	}

	public static ulong Parse(string s) {
		return Number.ParseUInt64(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo);
	}
	
	public static ulong Parse(string s, NumberStyles style) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Number.ParseUInt64(s, style, NumberFormatInfo.CurrentInfo);
	}
	
	public static ulong Parse(string s, IFormatProvider provider) {
		return Number.ParseUInt64(s, NumberStyles.Integer, NumberFormatInfo.GetInstance(provider));
	}
	
	public static ulong Parse(string s, NumberStyles style, IFormatProvider provider) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Number.ParseUInt64(s, style, NumberFormatInfo.GetInstance(provider));
	}
	
	public static bool TryParse(string s, out ulong result) {
		return Number.TryParseUInt64(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo, result);
	}
	
	public static bool TryParse(string s, NumberStyles style, IFormatProvider provider, out ulong result) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Number.TryParseUInt64(s, style, NumberFormatInfo.GetInstance(provider), result);
	}
	
	private this() {
	}
	
	// Override Objct's methods
	public override int GetHashCode() {
		return cast(int)(_value ^ cast(int)(_value >> 32));
	}
	
	public override bool Equals(Object obj) {
		if (obj.GetType() != UInt64.GetType())
			return false;
		
		return (cast(UInt64)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(ulong other) {
		return _value == other;
	}
	
	public int CompareTo(ulong value) {
		if (_value < value) return -1;
		if (_value > value) return 1;
		return 0;
	}
	
	TypeCode GetTypeCode() {
		return TypeCode.UInt64;
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
		return _value;
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
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "UInt64", "DateTime"));
	}
	
	string ToString(IFormatProvider provider = null) out (result) {
		assert(result);
	} body {
		return Number.FormatUInt64(_value, null, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	string ToString(string format, IFormatProvider provider = null) out (result) {
		assert(result);
	} body {
		return Number.FormatUInt64(_value, format, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	Object ToType(Type conversionType, IFormatProvider provider = null) {
		return Convert.DefaultToType(this, conversionType, provider);
	}
}