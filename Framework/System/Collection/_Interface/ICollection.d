module System.Collection._Interface.ICollection;

import System.Collection;


public interface ICollection(T) : IEnumerable!T {
	@property int Count();
	@property bool IsReadOnly();

	void Add(T item);
	void Clear();
	bool Contains(T item);
	void CopyTo(T[] array, int arrayIndex);
	bool Remove(T item);
}