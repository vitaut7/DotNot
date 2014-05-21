module System._Class.Int32;

import System;
import System.Globalization;


public final class Int32 : IConvertible, IFormattable, IComparable!int, IEquatable!int {
	alias opEquals = Equals;
	alias opCmp = CompareTo;
	public static const MaxValue = cast(int)0x7FFFFFFF;
	public static const MinValue = cast(int)0x80000000;
	
	alias Value this;
	private int _value;

	@property int Value() {
		return _value;
	}
	
	@property void Value(int value) {
		_value = value;
	}
	
	static Int32 opCall(int value) {
		Int32 ret = new Int32();
		ret._value = value;
		return ret;
	}

	public static int Parse(string s) {
		return Number.ParseInt32(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo);
	}
	
	public static int Parse(string s, NumberStyles style) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Number.ParseInt32(s, style, NumberFormatInfo.CurrentInfo);
	}
	
	public static int Parse(string s, IFormatProvider provider) {
		return Number.ParseInt32(s, NumberStyles.Integer, NumberFormatInfo.GetInstance(provider));
	}
	
	public static int Parse(string s, NumberStyles style, IFormatProvider provider) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Number.ParseInt32(s, style, NumberFormatInfo.GetInstance(provider));
	}
	
	public static bool TryParse(string s, out int result) {
		return Number.TryParseInt32(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo, result);
	}
	
	public static bool TryParse(string s, NumberStyles style, IFormatProvider provider, out int result) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Number.TryParseInt32(s, style, NumberFormatInfo.GetInstance(provider), result);
	}
	
	private this() {
	}
	
	// Override Objct's methods
	public override int GetHashCode() {
		return _value;
	}
	
	public override bool Equals(Object obj) {
		if (obj.GetType() != Int32.GetType())
			return false;
		
		return (cast(Int32)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(int other) {
		return _value == other;
	}
	
	public int CompareTo(int value) {
		if (_value < value) return -1;
		if (_value > value) return 1;
		return 0;
	}
	
	TypeCode GetTypeCode() {
		return TypeCode.Int32;
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
		return _value;
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
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Int32", "DateTime"));
	}

	string ToString(IFormatProvider provider = null) {
		Contract.Ensures(Contract.Result!string() !is null);
		return Number.FormatInt32(_value, null, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	string ToString(string format, IFormatProvider provider = null) {
		Contract.Ensures(Contract.Result!string() !is null);
		return Number.FormatInt32(_value, format, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	Object ToType(Type conversionType, IFormatProvider provider = null) {
		return Convert.DefaultToType(this, conversionType, provider);
	}
}