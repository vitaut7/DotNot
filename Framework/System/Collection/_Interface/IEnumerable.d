module System.Collection._Interface.IEnumerable;

import System.Collection;


interface IEnumerable(T) {
	IEnumerator!T GetEnumerator();

	final int opApply(int delegate(T) dg) {
		IEnumerator!T enumerator = GetEnumerator();
		while (enumerator.MoveNext()) {
			int result = dg(enumerator.Current);
			if (result)
				return result;
		}
		return 0;
	}
}