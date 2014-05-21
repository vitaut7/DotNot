module System.Reflection._Enum.PropertyAttributes;


public enum PropertyAttributes {
	None          = 0x0000,
	SpecialName   = 0x0200, // property is special.  Name describes how.
	
	// Reserved flags for Runtime use only.
	ReservedMask  = 0xf400,
	RTSpecialName = 0x0400, // Runtime(metadata internal APIs) should check name encoding.
	HasDefault    = 0x1000, // Property has default 
	Reserved2     = 0x2000, // reserved bit
	Reserved3     = 0x4000, // reserved bit 
	Reserved4     = 0x8000  // reserved bit 
}