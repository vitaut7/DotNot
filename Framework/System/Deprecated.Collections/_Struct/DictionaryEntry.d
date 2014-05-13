module System.Collections._Struct.DictionaryEntry;


public struct DictionaryEntry
{
	private Object _key;
	private Object _value;

	@property
	{
		Object Key() { return _key; }
		void Key(Object value) { _key = value; }

		Object Value() { return _value; }
		void Value(Object value) { _value = value; }
	}


	this(Object key, Object value)
	{
		_key = key;
		_value = value;
	}
}