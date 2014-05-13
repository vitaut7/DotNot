module System._Class.Boolean;

import System;


public final class Boolean : IConvertible, IComparable!bool, IEquatable!bool
{
	@internal public static const True = 1;
	@internal public static const False = 0;

	@internal public static const TrueLiteral = "True";
	@internal public static const FalseLiteral = "False";

	public static immutable TrueString = TrueLiteral;
	public static immutable FalseString = FalseLiteral;

	alias _value this;
	private bool _value;


	static Boolean opCall(bool value)
	{
		Boolean ret = new Boolean();
		ret._value = value;
		return ret;
	}

	public static Boolean Parse(string value)
	{
		if (!value)
			throw new ArgumentNullException("value");

		Boolean result;
		if (!TryParse(value, result))
	    	throw new FormatException(Environment.GetResourceString("Format_BadBoolean"));

		return result;
	}
	
	public static bool TryParse(string value, out Boolean result)
	{
		return false; //TODO
	}

	private this()
	{
	}

	// Override Objct's methods
	public override int GetHashCode()
	{
		return _value ? True : False;
	}

	public override string ToString()
	{
		return _value ? TrueLiteral : FalseLiteral;
	}

	public override bool Equals(Object obj)
	{
		if (obj.GetType() != Boolean.GetType())
			return false;

		return (cast(Boolean)obj)._value == _value;
	}

	// Implement interface methods
	public bool Equals(bool other)
	{
		return _value == other;
	}

	public int CompareTo(bool value)
	{
		if (_value == value)
			return 0;
		if (!_value)
			return -1;

		return 1;
	}





	TypeCode GetTypeCode()
	{
		return TypeCode.Boolean;
	}
	
	bool ToBoolean(IFormatProvider provider = null);
	char ToChar(IFormatProvider provider = null);
	byte ToByte(IFormatProvider provider = null);
	ubyte ToUByte(IFormatProvider provider = null);
	short ToInt16(IFormatProvider provider = null);
	ushort ToUInt16(IFormatProvider provider = null);
	int ToInt32(IFormatProvider provider = null);
	uint ToUInt32(IFormatProvider provider = null);
	long ToInt64(IFormatProvider provider = null);
	ulong ToUInt64(IFormatProvider provider = null);
	float ToFloat(IFormatProvider provider = null);
	double ToDouble(IFormatProvider provider = null);
	real ToReal(IFormatProvider provider = null);
	DateTime ToDateTime(IFormatProvider provider = null);
	string ToString(IFormatProvider provider = null);
	Object ToType(Type conversionType, IFormatProvider provider = null);
}