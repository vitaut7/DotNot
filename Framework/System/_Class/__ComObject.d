module System._Class.__ComObject;

import System;
import System.Reflection;
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
		synchronized(this)
		{
			if (_objectToDataMap !is null)
				data = _objectToDataMap[key];
		}
		return data;
	}

	@internal bool SetData(Object key, Object data)
	{
		bool added = false;
		synchronized(this)
		{
			if (_objectToDataMap is null)
				_objectToDataMap = new Hashtable();

			if (_objectToDataMap[key] is null)
			{
				_objectToDataMap[key] = data;
				added = true;
			}
		}
		return added;
	}

	@internal void ReleaseAllData()
	{
		synchronized(this)
		{
			if (_objectToDataMap !is null)
			{
				foreach (Object o; _objectToDataMap.Values)
				{
					IDisposable disposableObject = cast(IDisposable)o;
					if (disposableObject !is null)
						disposableObject.Dispose();

					__ComObject comObject = cast(__ComObject)o;
					if (comObject !is null)
						Marshal.ReleaseComObject(comObject);
				}

				_objectToDataMap = null;
			}
		}
	}

	@internal Object GetEventProvider(RuntimeType t)
	{
		Object evProvider = GetData(t);

		if (evProvider is null)
			evProvider = CreateEventProvider(t);

		return evProvider;
	}

	@internal int ReleaseSelf()
	{
		return Marshal.InternalReleaseComObject(this);
	}

	@internal int FinalReleaseSelf()
	{
		return Marshal.InternalReleaseComObject(this);
	}

	private Object CreateEventProvider(RuntimeType t)
	{
		Object evProvider = Activator.CreateInstance(null/*t*/, Activator.ConstructorDefault | BindingFlags.NonPublic, null, [this], null); //TODO
		if (!SetData(t, evProvider))
		{
			IDisposable dis = cast(IDisposable)evProvider;
			if (dis !is null)
				dis.Dispose();

			evProvider = GetData(t);
		}
		return evProvider;
	}
}