module System.Runtime.Serialization._Interface.IFormatterConverter;

import System;


public interface IFormatterConverter
{
	Object Convert(Object value, Type type);
	Object Convert(Object value, TypeCode typeCode);
	bool ToBoolean(Object value);
	char ToChar(Object value);
	byte ToByte(Object value);
	ubyte ToUByte(Object value);
	short ToInt16(Object value);
	ushort ToUInt16(Object value);
	int ToInt32(Object value);
	uint ToUInt32(Object value);
	long ToInt64(Object value);
	ulong ToUInt64(Object value);
	float ToFloat(Object value);
	double ToDouble(Object value);
	real ToReal(Object value);
	DateTime ToDateTime(Object value);
	string ToString(Object value);
}