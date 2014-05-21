module System._Class.IntPtr;

import System;
import System.Runtime.Serialization;


public final class IntPtr : ISerializable, IEquatable!IntPtr {
	alias opEquals = Equals;
	public static immutable IntPtr Zero;
	public static const Size = 8;

	alias Value this;
	private void* _value;

	@property void* Value() {
		return _value;
	}
	
	@property void Value(void* value) {
		_value = value;
	}

	bool Equals(IntPtr value) {
		return _value == value._value;
	}

	public IntPtr opBinary(string op)(long value) if (op == "+") {
		return new IntPtr(_value + value);
	}

	public IntPtr opBinary(string op)(long value) if (op == "-") {
		return new IntPtr(_value - value);
	}

	public this(long value) {
		_value = cast(void *)value;
	}

	public this(void* value) {
		_value = value;
	}

	private this(SerializationInfo info, StreamingContext context) {
		_value = cast(void *)info.GetInt64("value");
	}

	@internal bool IsNull() {
		return _value == null;
	}

	public override void GetObjectData(SerializationInfo info, StreamingContext context) {
		if (info is null)
			throw new ArgumentNullException("info");

		info.AddValue("value", cast(long)_value);
	}

	public override bool Equals(Object obj) {
		if (obj.GetType() == IntPtr.GetType())
			return _value == (cast(IntPtr)obj)._value;

		return false;
	}

	public override int GetHashCode() {
		return cast(int)_value;
	}

	public long ToInt64() {
		return cast(long)_value;
	}

	public string ToString(string format = null) {
		return Int64(cast(long)_value).ToString(CultureInfo.InvariantCulture);
	}

	public void* ToPointer() {
		return _value;
	}

	public static deprecated("Use IntPtr + offset") IntPtr Add(IntPtr pointer, long offset) {
		return pointer + offset;
	}

	public static deprecated("Use IntPtr - offset") IntPtr Substract(IntPtr pointer, long offset) {
		return pointer - offset;
	}
}