module System.Collection._Interface.IEnumerator;

import System;


public interface IEnumerator(T) : IDisposable {
	bool MoveNext();
	void Reset();

	@property T Current();
}