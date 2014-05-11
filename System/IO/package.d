module System.IO;

import System;

//TODO do __Hresutls, portuje sa v System._Hresults
mixin template __HResults()
{
	@internal public static const int COR_E_ENDOFSTREAM       = cast(int)0x80070026;
	@internal public static const int COR_E_FILELOAD          = cast(int)0x80131621;
	@internal public static const int COR_E_FILENOTFOUND      = cast(int)0x80070002;
	@internal public static const int COR_E_DIRECTORYNOTFOUND = cast(int)0x80070003;
	@internal public static const int COR_E_PATHTOOLONG       = cast(int)0x800700CE;
	@internal public static const int COR_E_IO                = cast(int)0x80131620;
}