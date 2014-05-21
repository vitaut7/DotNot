module System.Runtime.InteropServices;


public import System.Runtime.InteropServices._Interface._Exception;

public import System.Runtime.InteropServices._Class.MarshalDirectiveException;
public import System.Runtime.InteropServices._Class.SafeArrayRankMismatchException;
public import System.Runtime.InteropServices._Class.SafeArrayTypeMismatchException;


public interface IStringable {
	string ToString();
}

public class Marshal {
	import System;
	public static IntPtr /* IUnknown* */ GetIUnknownForObject(Object o) {
		assert(0);
	}

	public static int ReleaseComObject(Object o) { assert (0); }

	static int InternalReleaseComObject(Object o) {assert(0); }
}