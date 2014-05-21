module System._Interface.IObservable;

import System;


public interface IObservable(T) {
	IDisposable Subscribe(IObserver!T observer);
}