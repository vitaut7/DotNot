module System._Class.AppDomain;

import System;

alias void delegate(string[] args) AppDomainInitializer;
alias void delegate(Object sender, AssemblyLoadEventArgs args) AssemblyLoadEventHandler;
alias void delegate() CrossAppDomainDelegate;
alias Assembly delegate(Object sender, ResolveEventArgs args) ResolveEventHandler;