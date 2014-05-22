module System.Collection._Struct.KeyValuePair;

import System;


public struct KeyValuePair(TKey, TValue) {
	private TKey _key;
	private TValue _value;

	@property TKey Key() {
		return _key;
	}

	@property TValue Value() {
		return _value;
	}

	public this(TKey key, TValue value) {
		_key = key;
		_value = value;
	}

	public override string ToString() {
		StringBuilder s = StringBuilderCache.Acquire();
		s.Append('[');
		if (_key)
			s.Append(_key.ToString());

		if (_value)
			s.Append(_value.ToString());
		s.Append(']');

		return StringBuilderCache.GetStringAndRelease(s);
	}
}