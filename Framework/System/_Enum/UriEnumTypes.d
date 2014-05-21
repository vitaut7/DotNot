module System._Enum.UriEnumTypes;


public enum UriKind {
	RelativeOrAbsolute,
	Absolute,
	Relative
}


public enum UriComponents {
	Scheme                  = 0x1,
	UserInfo                = 0x2,
	Host                    = 0x4,
	Port                    = 0x8,
	Path                    = 0x10,
	Query                   = 0x20,
	Fragment                = 0x40,

	StrongPort              = 0x80,
	NormalizedHost          = 0x100,

	KeepDelimiter           = 0x40000000,
	SerializationInfoString = cast(int)0x80000000,

	AbsoluteUri             = Scheme   | UserInfo | Host | Port | Path | Query | Fragment,
	HostAndPort             = Host     | StrongPort,
	StrongAuthority         = UserInfo | Host     | StrongPort,
	SchemeAndServer         = Scheme   | Host     | Port,
	HttpRequestUrl          = Scheme   | Host     | Port | Path | Query,
	PathAndQuery            = Path     | Query,
}


public enum UriFormat {
	UriEscaped    = 1,
	Unescaped     = 2,
	SafeUnescaped = 3
}


public enum UriIdnScope {
	None,
	AllExceptIntranet,
	All
}


public enum UriHostNameType {
	Unknown,
	Basic,
	Dns,
	IPv4,
	IPv6
}


public enum UriPartial {
	Scheme,
	Authority,
	Path,
	Query
}