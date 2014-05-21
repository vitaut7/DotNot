module System.Collections._Interface.IDictionaryEnumerator;

import System.Collections;


public interface IDictionaryEnumerator {
	@property {
		Object Key();
		Object Value();
		DictionaryEntry Entry();
	}
}