module System._Class.AppDomain;

import System;
import System.Reflection;

alias void delegate(string[] args) AppDomainInitializer;
alias void delegate(Object sender, AssemblyLoadEventArgs args) AssemblyLoadEventHandler;
alias void delegate() CrossAppDomainDelegate;
alias Assembly delegate(Object sender, ResolveEventArgs args) ResolveEventHandler;


public class ResolveEventArgs : EventArgs
{
	private string _name;
	private Assembly _requestingAssembly;

	@property
	{
		public string Name() { return _name; }
		public Assembly RequestingAssembly() { return _requestingAssembly; }
	}


	public this(string name)
	{
		_name = name;
	}

	public this(string name, Assembly requestingAssembly)
	{
		_name = name;
		_requestingAssembly = requestingAssembly;
	}
}


public class AssemblyLoadEventArgs : EventArgs
{
	private Assembly _loadedAssembly;

	@property
	{
		public Assembly LoadedAssembly() { return _loadedAssembly; }
	}


	public this(Assembly loadedAssembly)
	{
		_loadedAssembly = loadedAssembly;
	}
}