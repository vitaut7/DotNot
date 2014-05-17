module System.Runtime.Serialization._Struct.StreamingContext;

import System;


public enum StreamingContextStates {
	CrossProcess   = 0x01,
	CrossMachine   = 0x02,
	File           = 0x04,
	Persistence    = 0x08,
	Remoting       = 0x10,
	Other          = 0x20,
	Clone          = 0x40,
	CrossAppDomain = 0x80,
	All            = 0xFF
}

struct StreamingContext
{
	private Object _additionalContext;
	private StreamingContextStates _state;

	@property public Object Context()
	{
		return _additionalContext;
	}

	@property public StreamingContextStates State()
	{
		return _state;
	}

	public this(StreamingContextStates state)
	{
		this(state, null);
	}

	public this(StreamingContextStates state, Object additional)
	{
		_state = state;
		_additionalContext = additional;
	}

	public bool Equals(StreamingContext obj)
	{
		if (obj._additionalContext == _additionalContext && obj._state == _state)
			return true;

		return false;
	}

	public int GetHashCode()
	{
		return cast(int)_state;
	}
}