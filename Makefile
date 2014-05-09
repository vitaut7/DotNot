_D = main.d \
System/package.d System/IAppDomainSetup.d

DFLAGS = -g -unittest -debug -ofFramework.exe $(_D)

all:
	@echo Compiling...
	@dmd $(DFLAGS)
	@echo O.K.

run:
	@rdmd $(DFLAGS)
	@echo Debuging...