module System.Collections._Interface.ICollection;

import System;
import System.Collections;


public interface ICollection : IEnumerable
{
	@property
	{
		int Count();
		Object SyncRoot();
		bool IsSynchronized();
	}

	void CopyTo(Array array, int index);
}