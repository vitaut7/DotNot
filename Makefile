_D = main.d
_D += $(wildcard System/*.[d])
_D += $(wildcard System/_Enum/*.[d])
_D += $(wildcard System/_Class/*.[d])
_D += $(wildcard System/_Struct/*.[d])
_D += $(wildcard System/_Delegate/*.[d])
_D += $(wildcard System/_Interface/*.[d])

DFLAGS += -g -debug -unittest -vtls -map Linker.map
DFLAGS += -wi -m64 -O -property -Idruntime/src -ofBuild/Framework.exe druntime\lib\druntime64.lib $(_D)
#DFLAGS += -release

all:
	@echo Compiling...
	
#	@rd /Q /S druntime\\lib
#	#@rd /Q /S druntime\\import
#	@cd druntime && make -f win64.mak

#	@dmd $(DFLAGS)
	@echo O.K.

run:
	@rdmd $(DFLAGS)
	@echo Debuging...