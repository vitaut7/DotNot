module System.Collection._Interface.IDictionary;

import System.Collection;


public interface IDictionary(TKey, TValue) : ICollection!(KeyValuePair!(TKey, TValue)) {
	TValue opIndex(TKey key);
	void opIndexAssign(TValue value, TKey key);

	@property ICollection!TKey Keys();
	@property ICollection!TValue Values();

	bool ContainsKey(TKey key);
	void Add(TKey key, TValue value);
	bool Remove(TKey key);
	bool TryGetValue(TKey key, out TValue value);
}