module System.Collections._Interface.IList;

import System.Collections;


public interface IList : ICollection {
	void opIndexAssign(Object value, int index);
	Object opIndex(int index);

	int Add(Object value);
	bool Contains(Object value);
}