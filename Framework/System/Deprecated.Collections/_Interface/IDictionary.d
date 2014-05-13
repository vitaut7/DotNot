module System.Collections._Interface.IDictionary;

import System.Collections;


public interface IDictionary : ICollection
{
	@property
	{
		ICollection Keys();
		ICollection Values();
		bool IsReadOnly();
		bool IsFixedSize();
	}

	void opIndexAssign(Object value, Object key);
	Object opIndex(Object key);

	bool Contains(Object key);
	void Add(Object key, Object value);
	void Clear();
	void Remove(Object key);
	IDictionaryEnumerator GetEnumerator();
}