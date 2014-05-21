module System.Reflection._Class.ManifestResourceInfo;

static import System.Reflection;

import System;
import System.Reflection;


public class ManifestResourceInfo
{
	private Assembly _containingAssembly;
	private string _containingFileName;
	private System.Reflection.ResourceLocation _resourceLocation;

	@property Assembly ReferencesAssembly()
	{
		return _containingAssembly;
	}

	@property string FileName()
	{
		return _containingFileName;
	}

	@property System.Reflection.ResourceLocation ResourceLocation()
	{
		return _resourceLocation;
	}

	public this(Assembly containingAssembly, string containingFileName, System.Reflection.ResourceLocation resourceLocation)
	{
		_containingAssembly = containingAssembly;
		_containingFileName = containingFileName;
		_resourceLocation = resourceLocation;
	}
}


public enum ResourceLocation
{
	Embedded = 0x1,
	ContainedInAnotherAssembly = 0x2,
	ContainedInManifestFile = 0x4
}