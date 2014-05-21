module System.Collections._Interface.IEnumerator;


public interface IEnumerator {
	@property {
		Object Current();
	}

	bool MoveNext();
	void Reset();
}