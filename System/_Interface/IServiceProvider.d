module System._Interface.IServiceProvider;

import System;


public interface IServiceProvider
{
	Object GetService(Type serviceType);
}