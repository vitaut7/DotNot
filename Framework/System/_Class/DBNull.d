module System._Class.DBNull;

import System;
import System.Runtime.Serialization;


public final class DBNull : ISerializable, IConvertible
{
	public static immutable DBNull Value = cast(immutable(DBNull))new DBNull();

	private this()
	{
	}

	private this(SerializationInfo info, StreamingContext context)
	{
		throw new NotSupportedException(Environment.GetResourceString("NotSupported_DBNullSerial"));
	}

	public void GetObjectData(SerializationInfo info, StreamingContext context)
	{
		//TODO
	}

	public override string ToString()
	{
		return String.Empty;
	}

	public string ToString(IFormatProvider provider)
	{
		return String.Empty;
	}

	public TypeCode GetTypeCode()
	{
		return TypeCode.DBNull;
	}

	bool ToBoolean(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	char ToChar(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	byte ToByte(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	ubyte ToUByte(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	short ToInt16(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	ushort ToUInt16(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	int ToInt32(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	uint ToUInt32(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	long ToInt64(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	ulong ToUInt64(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	float ToFloat(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	double ToDouble(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	real ToReal(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	DateTime ToDateTime(IFormatProvider provider)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromDBNull"));
	}

	Object ToType(Type conversionType, IFormatProvider provider)
	{
		return null;
		//TODO
	}
}