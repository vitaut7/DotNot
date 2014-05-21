module System._Interface.IProgress;


public interface IProgress(T) {
	void Report(T value);
}