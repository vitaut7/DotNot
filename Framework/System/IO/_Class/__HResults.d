module System.IO._Class.__HResults;


mixin template __HResults() {
	@internal static const COR_E_ENDOFSTREAM       = 0x80070026;
	@internal static const COR_E_FILELOAD          = 0x80131621;
	@internal static const COR_E_FILENOTFOUND      = 0x80070002;
	@internal static const COR_E_DIRECTORYNOTFOUND = 0x80070003;
	@internal static const COR_E_PATHTOOLONG       = 0x800700CE;
	@internal static const COR_E_IO                = 0x80131620;
}