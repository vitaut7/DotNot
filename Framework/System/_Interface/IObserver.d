module System._Interface.IObserver;


public interface IObserver(T) {
	void OnCompleted();
	void OnError(Exception error);
	void OnNext(T value);
}