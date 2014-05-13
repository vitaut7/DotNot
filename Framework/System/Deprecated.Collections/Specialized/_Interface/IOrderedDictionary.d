module System.Collections.Specialized._Interface.IOrderedDictionary;

import System.Collections;


public interface IOrderedDictionary : IDictionary
{
	void opIndexAssign(Object value, int index);
	Object opIndex(int index);

	void Insert(int index, Object key, Object value);
	void RemoveAt(int index);
}