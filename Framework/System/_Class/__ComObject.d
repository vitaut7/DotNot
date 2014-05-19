module System._Class.__ComObject;

import System;
import System.Runtime.InteropServices;


@internal class __ComObject : MarshalByRefObject
{
	private Hashtable _objectToDataMap;

	protected this()
	{
	}

	public override string ToString()
	{
		if (AppDomain.IsAppXModel())
		{
			IStringable stringableType = cast(IStringable)this;
			if (stringableType !is null)
				return stringableType.ToString();
		}
		return super.ToString();
	}

	@internal IntPtr GetIUnknown(out bool isURTAggregated)
	{
		isURTAggregated = false; //TODO
		return Marshal.GetIUnknownForObject(this);
	}

	@internal Object GetData(Object key)
	{
		Object data = null;


	}
}