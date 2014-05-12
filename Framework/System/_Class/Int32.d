module System._Class.Int32;

import System;
import std.stdio;


public final class Int32 : IComparable, /*IFormattable, IConvertible,*/ IComparableT!(int), IEquatable!(int)
{
	alias _value this;
	public static const int MaxValue = int.max;
	public static const int MinValue = int.min;

	private int _value;
	protected this() {}

	
	public int opCast()
	{
		return _value;
	}

	public static Int32 opCall(int value) {
		Int32 ret = new Int32();
		ret._value = value;
		return ret;
	}

	public override int CompareTo(Object obj)
	{
		if (obj is null)
			return 1;

		if (obj.ToString() == Int32.ToString())
		{
			Int32 i = cast(Int32)obj;
			if (_value < i._value) return -1;
			if (_value > i._value) return 1;
			return 0;
		}

		throw new ArgumentException (Environment.GetResourceString("Arg_MustBeInt32"));
	}

	public override int CompareTo(int other)
	{
		if (_value < other) return -1;
		if (_value > other) return 1;
		return 0;
	}

	public override bool Equals(Object obj)
	{
		if (Int32.ToString() != obj.ToString())
			return false;

		return _value == (cast(Int32)obj)._value;
	}

	public bool Equals(int other)
	{
		return _value == other;
	}

	public override int GetHashCode()
	{
		return _value;
	}
}


unittest
{
	try
	{
		assert(Int32(70).CompareTo(new Object()));
		assert(0);
	}
	catch
	{

	}

	assert(Int32(70).CompareTo(Int32(50)));
	assert(Int32(50).CompareTo(30));

	assert(!Int32(70).Equals(Int32(50)));
	assert(Int32(70).Equals(70));
}