module System.Collection._Interface.IList;

import System.Collection;


public interface IList(T) : ICollection!T {
	TValue opIndex(int index);
	void opIndexAssign(TValue value, int index);

	int IndexOf(T item);
	void Insert(int index, T item);
	void RemoveAt(int index);
}